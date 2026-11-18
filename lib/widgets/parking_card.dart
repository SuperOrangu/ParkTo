import 'package:material_ui/material_ui.dart';

import '../models/parking.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class ParkingStatusBadge extends StatelessWidget {
  final Parcheggio parcheggio;

  const ParkingStatusBadge({super.key, required this.parcheggio});

  @override
  Widget build(BuildContext context) {
    final bool libero = parcheggio.isBlu
        ? (parcheggio.postiLiberi ?? 0) > 0
        : parcheggio.stato == 'libero';
    final bool pieno = parcheggio.isBlu && (parcheggio.postiLiberi ?? 0) == 0;

    final Color background = pieno
        ? AppColors.full.withValues(alpha: 0.12)
        : AppColors.ok;
    final Color textColor = pieno ? AppColors.full : Colors.white;
    final String label = pieno
        ? 'Pieno'
        : libero
        ? 'Libero'
        : 'Occupato';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: pieno ? background : AppColors.ok,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: AppTextStyles.badge.copyWith(color: textColor, fontSize: 11),
      ),
    );
  }
}

class ParkingCard extends StatelessWidget {
  final Parcheggio parcheggio;
  final VoidCallback onTap;
  final bool showAddress;
  final bool showFreeCount;

  const ParkingCard({
    super.key,
    required this.parcheggio,
    required this.onTap,
    this.showAddress = true,
    this.showFreeCount = true,
  });

  @override
  Widget build(BuildContext context) {
    final String detail = parcheggio.isBlu
        ? '${parcheggio.via} · ${parcheggio.postiLiberi ?? 0} liberi'
        : '${parcheggio.via} · ${parcheggio.categoria ?? 'Strisce gialle'}';

    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      parcheggio.nome,
                      style: AppTextStyles.cardTitle,
                    ),
                  ),
                  if (showFreeCount)
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: parcheggio.isBlu
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 9,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.ok,
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: Text(
                                '${parcheggio.postiLiberi ?? 0} posti',
                                style: AppTextStyles.badge.copyWith(
                                  fontSize: 11,
                                ),
                              ),
                            )
                          : ParkingStatusBadge(parcheggio: parcheggio),
                    ),
                ],
              ),
              if (showAddress) ...[
                const SizedBox(height: 3),
                Text(detail, style: AppTextStyles.cardSubtitle),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
