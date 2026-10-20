Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.72.192.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792512538;
	b=3lXe/CoqBBHUzw3XKx5vEZMzpRNutqod3wgJbiBffWMYm0c0rN+5gA2iGSd17c1c2gBy
	 qB8zLN1R5IgbhVgkzp1yWs6eeRhbuvqmxzO+NJVzPTNzcElIut8WNns8bpe9jQ7oCMK/e
	 b8i238+v0OyLhvOb8ss66lyTfSMpTSCLYHUfKbSp5LMTIjmbAzox1uYFRZHRDsewakCLZ
	 S0qz/WeJSHvrkpa1yu4CrHBipXqnYOPAoHDgHy1m/6KH5hFzaFpnZcnMWZewkB+SRO+ch
	 KrZ8Qra4y+aHve9wrm3PVa94afSFaRMYihaKZGfslIdwpko4xhVFPBXHYPVQxYDhktA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792512538;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Received:
	 X-Gm-Message-State:X-Received:MIME-Version:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:
	 Content-Type:X-Provags-ID:X-Spam-Flag:UI-OutboundReport:
	 Content-Transfer-Encoding;
	bh=hocO+kvqRttGZ7sVeWi9VNQEuKwWjdqXxc1r7L9Sh70=;
	b=BJ5D+CpuC7JsA4pHfEp9NgjxY6G5ltotKBUU+uSrIJy9ep1CHEcrip/vWGq4vj+z1k0g
	 nuAlEXIymqjZFfISEqWCxcQF81/lBUqCYzhm2RhHUKmRVR1d9Qrg5Bu3l+7u3onvNVd7r
	 Mduvj5adWrUvGWRpLmwRu0ojep/3ui9ojxveWV8L5v5UUtXoQC3ObylpoEKF2VVT+mvZP
	 xvmb6f2HBImGfnWPnEFvB2DrNasGEltO5OUMi+sElM2ml/cL0PdHTXxReD5O+lMvlDW2G
	 WyblNtlXceBk+Fl5P5K08LyDIuqUYR8dMpv9MTIjQwAebqdvyrc686Ama3h7VxmFYhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realh.co.uk;
	spf=pass smtp.mailfrom=realh.co.uk;
	dkim=pass header.d=realh.co.uk header.i=h@realh.co.uk header.a=rsa-sha256 header.s=s1-ionos header.b=OSKXKYwS;
	arc=none smtp.remote-ip=217.72.192.75
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D07606A31A
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 16:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0D07606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realh.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realh.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realh.co.uk header.i=h@realh.co.uk header.a=rsa-sha256 header.s=s1-ionos header.b=OSKXKYwS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realh.co.uk;
	s=s1-ionos; t=1792512529; x=1793117329; i=h@realh.co.uk;
	bh=hocO+kvqRttGZ7sVeWi9VNQEuKwWjdqXxc1r7L9Sh70=;
	h=X-UI-Sender-Class:MIME-Version:From:Date:Message-ID:Subject:To:
	 Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=OSKXKYwSM64ath9hLgV8uNBt7t+e3dhyRXUFusz53fO+IVofB7o0rlF/QCl3X3IM
	 YZ5YUv8xtUB2ski5sto1O02BGZpje8wK1yFr0gHqUyYaoHho16SUt9H/AXPD5AW3I
	 uU4phwYinbehUhryCfgVga+j3dhx7yL8dUn6J2yWlh6TN1htcRnfRhbwdbyHblOXl
	 NUm0c6JY3Sk1CRITgNc9beO/2yCjAxsdnQfx82ULZQvDMGgZdc8vL13iytM4OmxO2
	 bifd6SIaXKFMLbdv4hYyV41bz449vG8eNByoSoR82lwCpCQM3dNldxUtpGtvOefZf
	 PNw58kbH5NikmYeZKQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue108
 [213.165.67.119]) with ESMTPSA (Nemesis) id 1MWRe1-1x7T6g09Hv-00KbIX for
 <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 18:08:49 +0200
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1aa27963eso1222810a12.1
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 09:08:48 -0700 (PDT)
X-Gm-Message-State: AFq9FYLY2Yf1SdPn9f2hCZ59iWMC20qwqxm12FO2dWUG5/PgSbOZFfjI
	sYqvsqkyL2qWKrdt4v+tZhF4FydNEnFATehshhdMTybT4eCzIo0JaJPZ+Uwnu2H5mLHMq9c1tyD
	qyOdVKoA0eRr8KmXRaI57Vcw5pyyC5xk=
X-Received: by 2002:a17:907:6e88:b0:c2e:204d:9490 with SMTP id
 a640c23a62f3a-c4604ed5c6cmr223291966b.17.1792512528545; Tue, 20 Oct 2026
 09:08:48 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Tony Houghton <h@realh.co.uk>
Date: Tue, 20 Oct 2026 17:08:32 +0100
X-Gmail-Original-Message-ID: <CA+GXpVWLVc+CkaF-WsRyBDKiEPrw0yARnDYR+quOAn15FOofQQ@mail.gmail.com>
X-Gm-Features: AclHuK-JDOsF61pSzdTP0CKWz6t0E84Ro2k5Zz4R2FJAX0DuiSYOWyVelccinl8
Message-ID: <CA+GXpVWLVc+CkaF-WsRyBDKiEPrw0yARnDYR+quOAn15FOofQQ@mail.gmail.com>
Subject: dvb_usb_v2: frontend kthread wedges in dvb_usb_fe_sleep, taking down
 the USB bus and machine shutdown (DVBSky S960)
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:K6rJ7DP2GpCiA2j54PaUFZD1HehNBa4/yj2BcVJXbh9raVrEI//
 ifZEZUUGKb1OxUlZKEfYQN4jmmvPrpkm5fTfZfUsYaI1y43eEAYKkH2gaOuwYpOX+slExLp
 +XhdHFgrCnIV8qbSuGWo//NqIgE8b+j55cIsfiVDehqIVWErJiN3GbrmKbhEkf0BxkVDV9L
 UTtu24LC+hdJINBXzfRAQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:W8q1Up7kEWI=;JhsDSryCaoS0yPBEWiBF+IL7HZF
 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
 o5jGrt3WKEwg8G5SrYJulBHZ
Content-Transfer-Encoding: quoted-printable

Hi,

A single userspace DVB app doing standard open/tune/read/close cycles
wedged my machine's USB bus and blocked shutdown hard enough to need
the plug pulled.  Root cause is an unbounded uninterruptible wait in
dvb_usb_fe_sleep().

Hardware: DVBSky S960 DVB-S2 USB tuner (0572:6831, Montage M88DS3103
demod, firmware dvb-demod-m88ds3103.fw v3.B), on USB 1-3.
Kernel: 7.2.9-arch1-1 (Arch stock), x86_64, dvb_usb_dvbsky on dvb_usb_v2.
(The 7.2.10 and 7.2.11 stable changelogs contain no dvb-usb changes,
so this code is identical in the latest stable.)

Full disclosure: the diagnosis, source analysis and patch were produced
with AI assistance; all logs and observations are from my own machine,
the bug is real and severe, and I stand behind the report.

What happened
=2D------------
One DVB scanning process (my own code, one frontend fd held open,
FE_SET_PROPERTY tune, demux section reads, no exotic ioctls) was
reading tables when the frontend kthread wedged ~1 minute in.  From
that point: the scan hung with ~zero CPU, a second scan instance
blocked in dvb_device_open, fuser showed no holders on the adapter
nodes, physical unplug/replug did not re-enumerate (USB disconnect was
logged but the driver disconnect never completed), kill -9 as root did
nothing (D state), and shutdown hung until I pulled the plug.

Logs (previous boot, trimmed; full journal available on request):

  Oct 19 22:39:14 kernel: INFO: task kdvb-ad-1-fe-0:153935 blocked for
more than 122 seconds.
  Oct 19 22:39:14 kernel:  Call Trace:
  Oct 19 22:39:14 kernel:   __schedule+0x3d5/0x990
  Oct 19 22:39:14 kernel:   schedule+0x2c/0xe0
  Oct 19 22:39:14 kernel:   bit_wait+0x1e/0xc0
  Oct 19 22:39:14 kernel:   __wait_on_bit+0xaf/0x130
  Oct 19 22:39:14 kernel:   out_of_line_wait_on_bit+0x97/0xc0
  Oct 19 22:39:14 kernel:   dvb_usb_fe_sleep+0x145/0x1c0 [dvb_usb_v2 ...]

  Oct 19 22:49:28 kernel: INFO: task realtv:157508 blocked for more
than 122 seconds.
  Oct 19 23:09:21 kernel: usb 1-3: USB disconnect, device number 7
  Oct 19 23:20:31 systemd: Killed process 157508 (realtv) ...
(SIGKILLs ineffective)

Second data point (pattern only, no traces): for the last few years I
was only using my other adapter, an EyeTV T230C clone (Si2168, also on
dvb_usb_dvbsky), with tvheadend. It did what I now believe was the same
thing: after days of uptime, streams would corrupt, then the device
would stop responding and any process which touched the affected device
or subsystem got stuck in the same trap. Recovery needed a physical
power-cycle of the stick. Newer firmware seemed to substantially reduce
the frequency of incidents if not eliminate them. Both sticks share
dvb_usb_v2's teardown path and the symptoms match.

Analysis (from torvalds/linux master sources)
=2D--------------------------------------------
dvb_usb_fe_sleep() in drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
does:

    set_bit(ADAP_SLEEP, &adap->state_bits);
    wait_on_bit(&adap->state_bits, ADAP_STREAMING, TASK_UNINTERRUPTIBLE);

ADAP_STREAMING clears only in dvb_usb_stop_feed(), on the last
demux/dvr close.  If that clear never arrives, the frontend kthread
sleeps in D forever holding fepriv->sem, and everything queues behind
it: kthread_stop() in release/disconnect/unregister, new opens in
dvb_frontend_start(), the USB disconnect path and hub workqueue, and
machine shutdown.  All of those stages were observed here (wchans
kthread_stop, dvb_device_open, and a D-state usb_hub_wq worker).

Notably, fuser showed no process holding any adapter fd while the bit
stayed set, so the driver reached a streaming-set-with-no-feeds state;
I read the feed refcounting as airtight, so the exact micro-path that
set it is unknown to me.  The fix does not depend on it: teardown must
never wait unconditionally on a bit whose clearer may never run.

Fix (attached patch, tested): bound the wait with
wait_on_bit_timeout() at 10s, and on timeout warn, force-clear the
bit and proceed with the sleep.  The force-clear is safe in both
states: feed_count, not the bit, gates re-entry in start_feed(), and
a later genuine stop_feed() re-clears idempotently.  Testing on this
hardware: module builds clean against 7.2.9-arch1-1, normal operation
is identical to stock, and I forced the timeout live by holding a
demux feed across a frontend close -- the warning fired at +10s and
everything unwound cleanly with no hung tasks.  I cannot reproduce
the original wedge on demand (once in a day of heavy use) but will
keep running the patched module and report back.

Separate observation, not addressed above: start_feed() never consults
ADAP_SLEEP, so a feed can start while a sleep is in progress; that bit
currently has no waiters at all.

Thanks for maintaining this code.

=2D-=20
Regards

Tony Houghton
