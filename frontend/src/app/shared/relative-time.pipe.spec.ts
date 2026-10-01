import { RelativeTimePipe } from './relative-time.pipe';

describe('RelativeTimePipe', () => {
  const pipe = new RelativeTimePipe();
  const now = new Date('2026-10-19T12:00:00Z');

  it('habla en minutos si ha pasado menos de una hora', () => {
    expect(pipe.transform('2026-10-19T11:55:00Z', now)).toBe('hace 5 minutos');
  });

  it('dice "ayer" si fue hace un día', () => {
    expect(pipe.transform('2026-10-18T12:00:00Z', now)).toBe('ayer');
  });
});
