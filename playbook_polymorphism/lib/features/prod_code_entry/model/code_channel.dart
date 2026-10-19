/// Where the one-time code is sent. [contact] is a made-up address it goes
/// to, and [label] is the title of the demo switcher.
enum CodeChannel {
  email('Email', 'anna@example.com'),
  sms('SMS', '+1 555 010 0123'),
  telegram('Telegram', '@playbook_bot');

  const CodeChannel(this.label, this.contact);

  final String label;
  final String contact;
}
