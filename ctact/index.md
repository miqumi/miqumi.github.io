<script>
function formatTimestamp(epochTimestamp) {
  const now = Math.floor(Date.now() / 1000);
  const difference = epochTimestamp - now;

  const days = Math.floor(difference / (60 * 60 * 24));
  const hours = Math.floor((difference % (60 * 60 * 24)) / (60 * 60));
  const minutes = Math.floor((difference % (60 * 60)) / 60);
  const seconds = difference % 60;

  return `in ${days} days, ${hours} hours, ${minutes} minutes, ${seconds} seconds`;
}

const epochTimestamp = 1697455800;
const formattedTimestamp = formatTimestamp(epochTimestamp);
</script>
Well yeah {{ formatTimestamp(1697455800) }} ig
