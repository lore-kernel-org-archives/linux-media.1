Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.126.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794180940;
	b=qErCrVEWG78cfuBqZnvNuyn7+uaTRFgEUU4XJSo8FZvPmGq0vxs6gCe9tHyLOTcJ6UvX
	 4tJvdTaFeiZ0F0L+mQoqOkf0k3phTWUGIAicsPhRGEtJ8rmuHXkvzZqUbs9Yao9tTyhqv
	 m5nJn6vbkJ1DGUoCuba4BcpgFOHiEtg1l+pE6fGiZt9tVah6uK1d6BQwf2RLnctr/kt3o
	 hx9Ybo2AVcCWEP+aafol/cWPKZADC9HtxRGckN2/p9IVwS6W3c7+q7/xctC+YI+orFQ87
	 K490KF1QclHBhwBMGWnfqbJbccVGToVGL3XgROKaI/RKHlTx2roUaz6EogzmNILckkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794180940;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=0/lWA9lxxR2tXfUDhzB0syjL/AeaO4R5tSXCdX0io6U=;
	b=SxQCHsv4sZuAc04eTVNBKaXbmFUoRWIgRWF3r7dFAC4RsMtvXSAF7u6VDwRnyBGsse73
	 +W26yDpS/c5Zah9dYFEfl1UsP6Y021z7XwNSZBVF+SbOpPv9ACfjln3ADYuC3Y4KHisP2
	 Zq4elYpUs2bnq6WzJjG3zz56jV/QRvM6HHe0wr0/MC3jSFsk089213m15UW9M/Ud5Amof
	 nJ+NFyWWAqiEugmBpwtK4K1FQOmMLSCbK+WqJpZMssmj+WWURrorZDnBbgBO6zPrq1nWC
	 dflxy7W/Y37czPcxTe7qAZnjg9jDePXgspyPWwvUR34pKM4ciHGPWD5ixY8hr3JI1Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realh.co.uk;
	spf=pass smtp.mailfrom=realh.co.uk;
	dkim=pass header.d=realh.co.uk header.i=h@realh.co.uk header.a=rsa-sha256 header.s=s1-ionos header.b=oKW7Op4D;
	arc=none smtp.remote-ip=212.227.126.131
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC3C606A31C
	for <linux-media@vger.kernel.org>; Sun,  8 Nov 2026 23:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADC3C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realh.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realh.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realh.co.uk header.i=h@realh.co.uk header.a=rsa-sha256 header.s=s1-ionos header.b=oKW7Op4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realh.co.uk;
	s=s1-ionos; t=1794180930; x=1794785730; i=h@realh.co.uk;
	bh=0/lWA9lxxR2tXfUDhzB0syjL/AeaO4R5tSXCdX0io6U=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=oKW7Op4DJ59wv8nMMwEdu4UcYyQOlhTZF6OFtDhlVYgGtPlG5r+YGAn2Q4+8IMXZ
	 kgnH/vUsk9qjl4/6n8RjHHW/ayyZtXBTK2/jTZpmFqvAO1ntVa/+BXC+8VpcS3vOH
	 +hi4EHXSRfhX7Kcx66cvGnAggu3C6fPIJEgoru8RukTyfBdkE8VAT/Irxn4cGoDev
	 AuNNkB0E77Th0f0O2Bf0UpCAFYWKcc19zf4/YV7DFK9QTM659V5N40lsTvS77sWne
	 ZPC3WGrN/SxUAl+jacsXCIqUT03rW/G9a43ggItfdOEUf3KAZmISPHRizh/tJ6MRO
	 pe1cD3zvogLd7pY9sQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue012
 [213.165.67.103]) with ESMTPSA (Nemesis) id 1M7v18-1xMMfg1MFW-008TPK; Mon, 09
 Nov 2026 00:35:30 +0100
From: Tony Houghton <h@realh.co.uk>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	dmantipov@yandex.ru,
	Tony Houghton <h@realh.co.uk>
Subject: [PATCH v2] media: dvb-usb-v2: bound the streaming wait in fe_sleep
Date: Sun,  8 Nov 2026 23:35:26 +0000
Message-ID: <20261108233526.4351-1-h@realh.co.uk>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BcFlp9Bx8FVsoSC5XV79QvPMfpCxvSwchOaq6rYZ+KblvjKDdNy
 iHUAayR5bVACjx6PICOuGEEZ+D7mykZiqvojD9ot1YPn/xYLKbTe4KCKCc+CGFdljrZiTVC
 4AjeN2O2gaAo7KxR/inEpwVt/YWKa8jzuMgSdLQjRx+kDBD5uw2LBx5dZsQ+YLnMJoldCzu
 sLsbiers4zJfeohue7f6A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xx3GnssInKM=;uV87wrlK77k1l0DeKl5GwVRAt3U
 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
 OWYP7Z997MIjwT/nIPJezdhhB

fe_sleep() waits TASK_UNINTERRUPTIBLE, with no timeout, for
ADAP_STREAMING to clear.  That bit clears only in stop_feed(), on the
last demux/dvr close.  If the clear never arrives the frontend kthread
wedges in D state forever holding fepriv->sem, and everything queues
behind it: kthread_stop() in release/disconnect/unregister, new opens
in dvb_frontend_start(), the USB disconnect path and hub workqueue,
and machine shutdown.

Observed on a DVBSky S960 (dvb_usb_dvbsky + m88ds3103): a single
userspace DVB app doing standard open/tune/read/close cycles; about a
minute in, the kthread wedged, a second app instance blocked in
dvb_device_open, unplug/replug did not re-enumerate, kill -9 did
nothing (D state), and shutdown hung until the plug was pulled:

  INFO: task kdvb-ad-1-fe-0:153935 blocked for more than 122 seconds.
    out_of_line_wait_on_bit+0x97/0xc0
    dvb_usb_fe_sleep+0x145/0x1c0 [dvb_usb_v2]

Notably, fuser showed no process holding any adapter fd while the bit
stayed set: the driver had reached a streaming-set-with-no-feeds
state by an unknown micro-path.  The path into sleep is mundane,
though -- the frontend kthread exits on its own right after the last
writer fd closes (dvb_shutdown_timeout defaults to 0) and the exit
path calls sleep -- so any stuck bit wedges it.

The same symptom set (USB DVB sticks dying, then whole-machine hang
on use or shutdown) was reported in July 2021 across then-current
Montage- and Si2168-based hardware, all served by dvb-usb-v2 drivers;
this completes that diagnosis five years on, with the kernel messages
that were missing at the time.

Bound the wait at 10s -- normal stops take milliseconds -- and on
timeout warn, force-clear the bit and proceed with the sleep.  The
force-clear is safe in both states: feed_count, not the bit, gates
re-entry in start_feed(), and a later genuine stop_feed() re-clears
idempotently.  Teardown becomes self-healing instead of
machine-wedging.

Source analysis produced with AI assistance; all logs and testing are
from the reporter's own hardware.

Link: https://lore.kernel.org/linux-media/CA+GXpVVR4LBUjMduNWs7pZAcwoTHmQU=
ExJcvBtxsr0oeubRVLw@mail.gmail.com/ (July 2021 report of the same symptoms=
)
Link: https://lore.kernel.org/linux-media/CA+GXpVWLVc+CkaF-WsRyBDKiEPrw0yA=
RnDYR+quOAn15FOofQQ@mail.gmail.com/ (v1 report with full incident evidence=
)
Link: https://lore.kernel.org/linux-media/CA+GXpVXvGkz1cNwaPzsLQZ-wtbZPaxP=
PNZB-gEf-rD=3DO=3DMs6wA@mail.gmail.com/ (v1 follow-up with patch and logs)
Signed-off-by: Tony Houghton <h@realh.co.uk>
=2D--
Testing (7.2.14-arch1-1, stock vs patched dvb_usb_v2, healthy Si2168
stick, synthetic trigger holding a demux feed across a frontend close
=2D- no tune, no data, no sick firmware; reproducer script below):

Stock: kthread S->D immediately on close, wchan dvb_usb_fe_sleep,
stack dvb_usb_fe_sleep+0x145 -- the same wait site as the incident
trace above -- held for the full 20s observation window (no timeout),
exited cleanly on feed release.

Patched: kthread D for 10s, kernel warning, clean thread exit with
the feed still held; feed release afterwards uneventful.

=2D--8<--- stock probe log ---
[21:28:07] uname: 7.2.14-arch1-1  adapter=3D1  dvb_shutdown_timeout=3D0  h=
old=3D20.0s
[21:28:07] opened /dev/dvb/adapter1/frontend0
[21:28:08] demux feed STARTED on /dev/dvb/adapter1/demux0 (ADAP_STREAMING =
now set)
[21:28:08] kthread before close: alive=3DTrue state=3DS wchan=3Ddvb_fronte=
nd_thread
[21:28:08] frontend close() returned in 0.00s (expected instant; wedge sho=
ws in kthread)
[21:28:08] t+  0.0s kthread state=3DD wchan=3Ddvb_usb_fe_sleep
[21:28:08]     stack: [<0>] dvb_usb_fe_sleep+0x145/0x1c0 [dvb_usb_v2]
[21:28:08]     stack: [<0>] dvb_frontend_thread+0x49d/0x8a0 [dvb_core]
[21:28:08]     stack: [<0>] kthread+0xe4/0x120
[21:28:08]     stack: [<0>] ret_from_fork+0x2a7/0x330
[21:28:08]     stack: [<0>] ret_from_fork_asm+0x1a/0x30
[21:28:27] t+ 19.3s kthread state=3DD wchan=3Ddvb_usb_fe_sleep
[21:28:27]     stack: [<0>] dvb_usb_fe_sleep+0x145/0x1c0 [dvb_usb_v2]
[21:28:27]     stack: [<0>] dvb_frontend_thread+0x49d/0x8a0 [dvb_core]
[21:28:27]     stack: [<0>] kthread+0xe4/0x120
[21:28:27]     stack: [<0>] ret_from_fork+0x2a7/0x330
[21:28:27]     stack: [<0>] ret_from_fork_asm+0x1a/0x30
[21:28:28] VERDICT: kthread D-state from t+0.0s through t+20.0s -> NO TIME=
OUT (stock behaviour)
[21:28:28] closing demux fd (releases the feed)
[21:28:29] after feed release: kthread alive=3DFalse state=3Dgone wchan=3D
[21:28:29] new dmesg lines since start:
[21:28:29]     [ 2359.202178] si2168 16-0064: downloading firmware from fi=
le 'dvb-demod-si2168-d60-01.fw'
[21:28:29]     [ 2360.348901] si2168 16-0064: firmware version: D 6.0.13
[21:28:29] done in 22.0s total
=2D--8<--- end stock probe log ---
=2D--8<--- patched probe log ---
[21:56:48] uname: 7.2.14-arch1-1  adapter=3D1  dvb_shutdown_timeout=3D0  h=
old=3D25.0s
[21:56:48] opened /dev/dvb/adapter1/frontend0
[21:56:49] demux feed STARTED on /dev/dvb/adapter1/demux0 (ADAP_STREAMING =
now set)
[21:56:49] kthread before close: alive=3DTrue state=3DS wchan=3Ddvb_fronte=
nd_thread
[21:56:49] frontend close() returned in 0.00s (expected instant; wedge sho=
ws in kthread)
[21:56:49] t+  0.0s kthread state=3DD wchan=3Ddvb_usb_fe_sleep
[21:56:49]     stack: [<0>] dvb_usb_fe_sleep+0x14b/0x1d0 [dvb_usb_v2]
[21:56:49]     stack: [<0>] dvb_frontend_thread+0x49d/0x8a0 [dvb_core]
[21:56:49]     stack: [<0>] kthread+0xe4/0x120
[21:56:49]     stack: [<0>] ret_from_fork+0x2a7/0x330
[21:56:49]     stack: [<0>] ret_from_fork_asm+0x1a/0x30
[21:57:00] t+ 11.2s kthread GONE (exited with feed held)
[21:57:00] VERDICT: kthread exited at t+11.2s with feed held -> TIMEOUT fi=
red (patched behaviour)
[21:57:00] closing demux fd (releases the feed)
[21:57:01] after feed release: kthread alive=3DFalse state=3Dgone wchan=3D
[21:57:01] new dmesg lines since start:
[21:57:01]     [  328.216162] si2168 16-0064: downloading firmware from fi=
le 'dvb-demod-si2168-d60-01.fw'
[21:57:01]     [  329.358157] si2168 16-0064: firmware version: D 6.0.13
[21:57:01]     [  339.568843] usb 1-4: dvb_usb_fe_sleep: timed out waiting=
 for streaming to stop; forcing sleep
[21:57:01] done in 12.9s total
=2D--8<--- end patched probe log ---
=2D--8<--- reproducer script (run: sudo ./dvb_usb_fe_sleep_probe.py <adapt=
er> <hold_seconds> <logfile>) ---
#!/usr/bin/env python3
"""Stock/patched-module probe: hold a demux feed across a frontend close.

Mechanism (dvb-core): the frontend kthread exits on its own right after
the last writer fd closes (dvb_shutdown_timeout defaults to 0) and the
exit path calls fe->ops.sleep =3D dvb_usb_fe_sleep, which waits for the
ADAP_STREAMING bit to clear. So close() itself returns instantly; the
WEDGE SHOWS IN THE KTHREAD, not in close().

Expected on STOCK: kthread S -> D within ~2s of close, stays D for the
whole hold (no timeout), exits cleanly once the demux fd is closed.

Expected on PATCHED: kthread S -> D, then GONE at +10s (timeout heal)
with the feed still held, plus a kernel warning.

No tuning, no RF: the wait keys off the ADAP_STREAMING bit, set by
feed START, not data flow. Pure software trigger.

Usage: sudo ./dvb_usb_fe_sleep_probe.py <adapter> <hold_seconds> <logfile>
"""
import fcntl
import os
import struct
import subprocess
import sys
import time

adapter =3D int(sys.argv[1]) if len(sys.argv) > 1 else 1
HOLD_SECS =3D float(sys.argv[2]) if len(sys.argv) > 2 else 20.0
LOGFILE =3D sys.argv[3] if len(sys.argv) > 3 else "/tmp/dvb_usb_probe.log"

FE =3D f"/dev/dvb/adapter{adapter}/frontend0"
DMX =3D f"/dev/dvb/adapter{adapter}/demux0"

logfh =3D open(LOGFILE, "w")


def log(msg):
    line =3D f"[{time.strftime('%H:%M:%S')}] {msg}"
    print(line, flush=3DTrue)
    logfh.write(line + "\n")
    logfh.flush()


def iow(magic, nr, size):
    return (1 << 30) | (size << 16) | (ord(magic) << 8) | nr


DMX_SET_FILTER =3D iow('o', 43, 60)
DMX_IMMEDIATE_START =3D 0x04
DMX_CHECK_CRC =3D 0x01


def kthread_state():
    """Return (alive, state, wchan, stack_top4) for kdvb-ad-N-fe-0."""
    try:
        out =3D subprocess.run(
            ["pgrep", "-f", f"kdvb-ad-{adapter}-fe-0"],
            capture_output=3DTrue, text=3DTrue).stdout.strip()
    except Exception as e:
        return (False, f"pgrep failed: {e}", "", [])
    if not out:
        return (False, "gone", "", [])
    pid =3D out.split()[0]
    try:
        with open(f"/proc/{pid}/stat") as f:
            state =3D f.read().split()[2]
    except Exception:
        return (False, "gone", "", [])
    try:
        with open(f"/proc/{pid}/wchan") as f:
            wchan =3D f.read().strip()
    except Exception as e:
        wchan =3D f"wchan failed: {e}"
    try:
        with open(f"/proc/{pid}/stack") as f:
            stack =3D [l.strip() for l in f.readlines()[:5]]
    except Exception as e:
        stack =3D [f"stack failed: {e}"]
    return (True, state, wchan, stack)


def dmesg_new(since_lines):
    try:
        out =3D subprocess.run(["dmesg"], capture_output=3DTrue,
                             text=3DTrue).stdout.splitlines()
        return out[since_lines:]
    except Exception as e:
        return [f"dmesg failed: {e}"]


def main():
    t0 =3D time.time()
    try:
        with open("/sys/module/dvb_core/parameters/dvb_shutdown_timeout") =
as f:
            sdt =3D f.read().strip()
    except Exception:
        sdt =3D "?"
    log(f"uname: {os.uname().release}  adapter=3D{adapter}  "
        f"dvb_shutdown_timeout=3D{sdt}  hold=3D{HOLD_SECS}s")
    d0 =3D len(subprocess.run(["dmesg"], capture_output=3DTrue,
                            text=3DTrue).stdout.splitlines())
    fe =3D os.open(FE, os.O_RDWR)
    log(f"opened {FE}")
    dmx =3D os.open(DMX, os.O_RDWR)
    params =3D struct.pack("<H48s2xII", 0x11, bytes(48), 0,
                         DMX_CHECK_CRC | DMX_IMMEDIATE_START)
    fcntl.ioctl(dmx, DMX_SET_FILTER, params)
    log(f"demux feed STARTED on {DMX} (ADAP_STREAMING now set)")
    alive, state, wchan, _ =3D kthread_state()
    log(f"kthread before close: alive=3D{alive} state=3D{state} wchan=3D{w=
chan}")

    t_close =3D time.time()
    os.close(fe)
    log(f"frontend close() returned in {time.time() - t_close:.2f}s "
        f"(expected instant; wedge shows in kthread)")

    # Poll the kthread through the hold.
    entered_D =3D None
    exited_early =3D None
    last_sig =3D None
    deadline =3D t_close + HOLD_SECS
    while time.time() < deadline:
        alive, state, wchan, stack =3D kthread_state()
        now =3D time.time() - t_close
        sig =3D (alive, state, wchan)
        if sig !=3D last_sig or now >=3D HOLD_SECS - 1.0:
            if alive:
                log(f"t+{now:5.1f}s kthread state=3D{state} wchan=3D{wchan=
}")
                if state =3D=3D "D":
                    if entered_D is None:
                        entered_D =3D now
                    for frame in stack:
                        log(f"    stack: {frame}")
            else:
                log(f"t+{now:5.1f}s kthread GONE (exited with feed held)")
                if exited_early is None:
                    exited_early =3D now
            last_sig =3D sig
        if not alive:
            break
        time.sleep(1.0)

    if exited_early is not None:
        log(f"VERDICT: kthread exited at t+{exited_early:.1f}s with feed "
            f"held -> TIMEOUT fired (patched behaviour)")
    elif entered_D is not None:
        log(f"VERDICT: kthread D-state from t+{entered_D:.1f}s through "
            f"t+{HOLD_SECS:.1f}s -> NO TIMEOUT (stock behaviour)")
    else:
        log("VERDICT: INCONCLUSIVE -- kthread never entered D; feed may "
            "not have set ADAP_STREAMING (probe invalid, investigate)")

    log("closing demux fd (releases the feed)")
    os.close(dmx)
    for _ in range(10):
        time.sleep(0.5)
        alive, state, wchan, _ =3D kthread_state()
        if not alive:
            break
    # A fresh open restarts the kthread; absence now means it exited.
    log(f"after feed release: kthread alive=3D{alive} state=3D{state} "
        f"wchan=3D{wchan}")
    log("new dmesg lines since start:")
    new =3D dmesg_new(d0)
    if new:
        for line in new[-15:]:
            log(f"    {line}")
    else:
        log("    (none)")
    log(f"done in {time.time() - t0:.1f}s total")


try:
    main()
finally:
    logfh.close()
=2D--8<--- end reproducer script ---

v2 changes: rebased onto 7.2.14 and converted the force-clear to
clear_and_wake_up_bit(), consistent with Dmitry Antipov's in-flight
dvb-usb-v2 bitops cleanup (same function, disjoint hunk -- applies
with or without it); added synthetic-repro evidence on stock;
corrected the trigger description (kthread self-exit on last close,
not close() blocking); referenced the July 2021 report.

 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c b/drivers/media/u=
sb/dvb-usb-v2/dvb_usb_core.c
index bd86d25..9bc3122 100644
=2D-- a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
+++ b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
@@ -600,8 +600,23 @@ static int dvb_usb_fe_sleep(struct dvb_frontend *fe)
=20
 	if (!adap->suspend_resume_active) {
 		set_bit(ADAP_SLEEP, &adap->state_bits);
-		wait_on_bit(&adap->state_bits, ADAP_STREAMING,
-				TASK_UNINTERRUPTIBLE);
+		/*
+		 * Bounded wait: ADAP_STREAMING clears in stop_feed(), on
+		 * the last demux/dvr close.  If that never arrives, an
+		 * unbounded wait wedges this kthread in D state and with
+		 * it kthread_stop() (release/disconnect/unregister), new
+		 * opens, the USB hub workqueue and machine shutdown.
+		 * Normal stops take milliseconds; 10s is ample even for
+		 * sick-but-alive hardware.
+		 */
+		if (wait_on_bit_timeout(&adap->state_bits, ADAP_STREAMING,
+					TASK_UNINTERRUPTIBLE,
+					msecs_to_jiffies(10000))) {
+			dev_warn(&d->udev->dev,
+				 "%s: timed out waiting for streaming to stop; forcing sleep\n",
+				 __func__);
+			clear_and_wake_up_bit(ADAP_STREAMING, &adap->state_bits);
+		}
 	}
=20
 	if (adap->fe_sleep[fe->id]) {
