Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=92.243.27.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792952059;
	b=uayBZ5vEYQB/3uu7Wm7XY2QRKtvyKiYFNQlRGfQUNGoasIvbO8PFJ7cfSBpvR7LVK6w8
	 StLhtVUu8UAXq01wBsSzw8fpK/ddaYB+UKwmamjq/6uHSjaY6Azxo4sLKEkO6xNEkNcSy
	 0UG2CFuaJESvYshSxJh1h88bZArRjDnd8lZpNA9f7Rymmayg1n1+BfdEKX4VGX46G2G/A
	 fsPweOYDq4mWImHO54XlQaci66H+wYKVGQJZOjakX9QzmtRHe98jDDJ7o4nCoxG+dCSzL
	 5LtnEtjpwHLP1xKgIdzts+/ftAu1F9d/4atorIyy+g9NjVFVMp63Lb41rEd3m7fMDTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792952059;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=GHTvY6MJmucV3K+GAuG/XK+212p8vLKP/QAEWOC5pOI=;
	b=eedJPLXKqFFv0QNKWAraVFj3pEo7N1xXG1dEhg7PLibm/ruLLD4/vYrtW4x/Zf7r1bvl
	 TtwNVTfXpRSVh+I4BbgpaqL+FoMOTyWTW3IdFPs26/72H/Z+EwaVDCfUbVtKHr95fvB9/
	 t/qw1mjPzqu84ZFRiMl9rjo/l7Z8/0AsqBW7FSmej3APgl7amIkL40kE/EUBCSyagTojc
	 FhMXcsulGQhRCR8zBa+2d03CbIwQtOL2Z7aEmAe2+h/RDTimg+bM93vKhvu6idcbsRfAj
	 2Cyk03fPQY/PbYe3/OuC9GAI+9NM3hBU7C1OWpiVnv3UDhzmE1MyR7/N4p1ARlw6Xtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mess.org;
	spf=pass smtp.mailfrom=mess.org;
	dkim=pass header.d=mess.org header.i=@mess.org header.a=rsa-sha256 header.s=2020 header.b=NdzG6gey;
	dkim=pass header.d=mess.org header.i=@mess.org header.a=rsa-sha256 header.s=2020 header.b=moqlcaM3;
	arc=none smtp.remote-ip=92.243.27.206
Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88DB606A31B
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 18:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C88DB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mess.org header.i=@mess.org header.a=rsa-sha256 header.s=2020 header.b=NdzG6gey;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.a=rsa-sha256 header.s=2020 header.b=moqlcaM3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1792952050; bh=+/Bc14zDz1zDuEXLXljBwCk5Y3QiSoimLoY9vOehLUo=;
	h=From:To:Cc:Subject:Date:From;
	b=NdzG6geyD2Ng/c0n2UjPsm1KDxj+Bes/dh55cr1QYFZKq24mG8ZPXaEySYMSdqbpt
	 dd2UG1G8Uaxx9fy2R5KFf56v40vmgW3Mitx7CiT9O1nEMq/X0RTaWR7pJlyPCCcSQE
	 qY29BnPB8WO8MxtXnwI7fLgFxeCcIDB7BDirsy+tqV18jx7X7XWQ7pnIm8myY9nE5l
	 clVAf6oPg5yjJvE+iOzZqjK3gnGXQlJ1woofTN3+lDpzJF81z59+57GRwjM5HFsKuY
	 Lun7eih5qbYGgCYzXtkApCPS5+msxo7wZEA6769JylYT65rjcnfFFbRY5RY6Dpa/3/
	 Z4AaeX5t8DeDA==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id DE88B40B30; Sun, 25 Oct 2026 18:14:10 +0000 (GMT)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1792952049; bh=+/Bc14zDz1zDuEXLXljBwCk5Y3QiSoimLoY9vOehLUo=;
	h=From:To:Cc:Subject:Date:From;
	b=moqlcaM3eutSsFaQwvtzWrBf50kdMQJT+N0/yOvUxF9bHRIuonh3xbdw9SiMoeIGU
	 Mhg9VKscmu3IFMGgjNUzASTkFsLbJmNZoSY/++nXWTCjkpN0XW5cXV7bpq4k+ktco3
	 5kUrQZ8gKLGlC53dA9BDlZsXmzUSiM9CNGdZjCQwX5znwWyfR+bIedZAsN/V1pBSbB
	 Vahk7BzVKqJIh8BGvjUAuH/yYHemjlcaXuqo4zxZUOnrnGVIdHKCMbTfxiC6kw+tmD
	 LxfR5yu2EZaC4JIlQmBRCw0/GlKuByZk1/nGli6Kht8E6RATQnshrwaSDWbzKJmxhX
	 18rnXQcmNsYfg==
Received: from maru.home (host86-145-132-241.range86-145.btcentralplus.com [86.145.132.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 70D284015D;
	Sun, 25 Oct 2026 18:14:09 +0000 (GMT)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Cc: Sean Young <sean@mess.org>
Subject: [PATCH 0/5] rc-core fixes
Date: Sun, 25 Oct 2026 18:13:40 +0000
Message-ID: <cover.1792951808.git.sean@mess.org>
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
Content-Transfer-Encoding: 8bit

A few random rc-core fixes and improvements.

Sean Young (5):
  media: rc: Remove pointless msleep() after request_module()
  media: rc: Prevent overflow in ir_raw_event_store_edge()
  media: rc: Do not touch rx state when unregistering a tx-only device
  media: imon: Replace pr_err() with dev_err() and friends
  media: rc: struct rc_map should have entries and capacity

 drivers/media/rc/imon.c                       | 93 ++++++++-----------
 .../media/rc/keymaps/rc-adstech-dvb-t-pci.c   |  2 +-
 drivers/media/rc/keymaps/rc-alink-dtu-m.c     |  2 +-
 drivers/media/rc/keymaps/rc-anysee.c          |  2 +-
 drivers/media/rc/keymaps/rc-apac-viewcomp.c   |  2 +-
 .../media/rc/keymaps/rc-astrometa-t2hybrid.c  |  2 +-
 drivers/media/rc/keymaps/rc-asus-pc39.c       |  2 +-
 drivers/media/rc/keymaps/rc-asus-ps3-100.c    |  2 +-
 .../rc/keymaps/rc-ati-tv-wonder-hd-600.c      |  2 +-
 drivers/media/rc/keymaps/rc-ati-x10.c         |  2 +-
 drivers/media/rc/keymaps/rc-avermedia-a16d.c  |  2 +-
 .../media/rc/keymaps/rc-avermedia-cardbus.c   |  2 +-
 drivers/media/rc/keymaps/rc-avermedia-dvbt.c  |  2 +-
 drivers/media/rc/keymaps/rc-avermedia-m135a.c |  2 +-
 .../rc/keymaps/rc-avermedia-m733a-rm-k6.c     |  2 +-
 drivers/media/rc/keymaps/rc-avermedia-rm-ks.c |  2 +-
 drivers/media/rc/keymaps/rc-avermedia.c       |  2 +-
 drivers/media/rc/keymaps/rc-avertv-303.c      |  2 +-
 .../media/rc/keymaps/rc-azurewave-ad-tu700.c  |  2 +-
 drivers/media/rc/keymaps/rc-beelink-gs1.c     |  2 +-
 drivers/media/rc/keymaps/rc-beelink-mxiii.c   |  2 +-
 drivers/media/rc/keymaps/rc-behold-columbus.c |  2 +-
 drivers/media/rc/keymaps/rc-behold.c          |  2 +-
 drivers/media/rc/keymaps/rc-budget-ci-old.c   |  2 +-
 drivers/media/rc/keymaps/rc-cec.c             |  2 +-
 drivers/media/rc/keymaps/rc-cinergy-1400.c    |  2 +-
 drivers/media/rc/keymaps/rc-cinergy.c         |  2 +-
 drivers/media/rc/keymaps/rc-ct-90405.c        |  2 +-
 drivers/media/rc/keymaps/rc-d680-dmb.c        |  2 +-
 drivers/media/rc/keymaps/rc-delock-61959.c    |  2 +-
 drivers/media/rc/keymaps/rc-dib0700-nec.c     |  2 +-
 drivers/media/rc/keymaps/rc-dib0700-rc5.c     |  2 +-
 .../media/rc/keymaps/rc-digitalnow-tinytwin.c |  2 +-
 drivers/media/rc/keymaps/rc-digittrade.c      |  2 +-
 drivers/media/rc/keymaps/rc-dm1105-nec.c      |  2 +-
 drivers/media/rc/keymaps/rc-dntv-live-dvb-t.c |  2 +-
 .../media/rc/keymaps/rc-dntv-live-dvbt-pro.c  |  2 +-
 drivers/media/rc/keymaps/rc-dreambox.c        |  2 +-
 drivers/media/rc/keymaps/rc-dtt200u.c         |  2 +-
 drivers/media/rc/keymaps/rc-dvbsky.c          |  2 +-
 drivers/media/rc/keymaps/rc-dvico-mce.c       |  2 +-
 drivers/media/rc/keymaps/rc-dvico-portable.c  |  2 +-
 drivers/media/rc/keymaps/rc-em-terratec.c     |  2 +-
 .../media/rc/keymaps/rc-encore-enltv-fm53.c   |  2 +-
 drivers/media/rc/keymaps/rc-encore-enltv.c    |  2 +-
 drivers/media/rc/keymaps/rc-encore-enltv2.c   |  2 +-
 drivers/media/rc/keymaps/rc-evga-indtube.c    |  2 +-
 drivers/media/rc/keymaps/rc-eztv.c            |  2 +-
 drivers/media/rc/keymaps/rc-flydvb.c          |  2 +-
 drivers/media/rc/keymaps/rc-flyvideo.c        |  2 +-
 drivers/media/rc/keymaps/rc-fusionhdtv-mce.c  |  2 +-
 drivers/media/rc/keymaps/rc-gadmei-rm008z.c   |  2 +-
 drivers/media/rc/keymaps/rc-geekbox.c         |  2 +-
 .../media/rc/keymaps/rc-genius-tvgo-a11mce.c  |  2 +-
 drivers/media/rc/keymaps/rc-gotview7135.c     |  2 +-
 drivers/media/rc/keymaps/rc-hauppauge.c       |  2 +-
 drivers/media/rc/keymaps/rc-hisi-poplar.c     |  2 +-
 drivers/media/rc/keymaps/rc-hisi-tv-demo.c    |  2 +-
 drivers/media/rc/keymaps/rc-imon-mce.c        |  2 +-
 drivers/media/rc/keymaps/rc-imon-pad.c        |  2 +-
 drivers/media/rc/keymaps/rc-imon-rsc.c        |  2 +-
 drivers/media/rc/keymaps/rc-iodata-bctv7e.c   |  2 +-
 drivers/media/rc/keymaps/rc-it913x-v1.c       |  2 +-
 drivers/media/rc/keymaps/rc-it913x-v2.c       |  2 +-
 drivers/media/rc/keymaps/rc-kaiomy.c          |  2 +-
 drivers/media/rc/keymaps/rc-khadas.c          |  2 +-
 drivers/media/rc/keymaps/rc-khamsin.c         |  2 +-
 drivers/media/rc/keymaps/rc-kworld-315u.c     |  2 +-
 drivers/media/rc/keymaps/rc-kworld-pc150u.c   |  2 +-
 .../rc/keymaps/rc-kworld-plus-tv-analog.c     |  2 +-
 .../media/rc/keymaps/rc-leadtek-y04g0051.c    |  2 +-
 drivers/media/rc/keymaps/rc-lme2510.c         |  2 +-
 drivers/media/rc/keymaps/rc-manli.c           |  2 +-
 drivers/media/rc/keymaps/rc-mecool-kii-pro.c  |  2 +-
 drivers/media/rc/keymaps/rc-mecool-kiii-pro.c |  2 +-
 .../rc/keymaps/rc-medion-x10-digitainer.c     |  2 +-
 drivers/media/rc/keymaps/rc-medion-x10-or2x.c |  2 +-
 drivers/media/rc/keymaps/rc-medion-x10.c      |  2 +-
 drivers/media/rc/keymaps/rc-minix-neo.c       |  2 +-
 drivers/media/rc/keymaps/rc-msi-digivox-ii.c  |  2 +-
 drivers/media/rc/keymaps/rc-msi-digivox-iii.c |  2 +-
 .../media/rc/keymaps/rc-msi-tvanywhere-plus.c |  2 +-
 drivers/media/rc/keymaps/rc-msi-tvanywhere.c  |  2 +-
 drivers/media/rc/keymaps/rc-mygica-utv3.c     |  2 +-
 drivers/media/rc/keymaps/rc-nebula.c          |  2 +-
 .../rc/keymaps/rc-nec-terratec-cinergy-xs.c   |  2 +-
 drivers/media/rc/keymaps/rc-norwood.c         |  2 +-
 drivers/media/rc/keymaps/rc-npgtech.c         |  2 +-
 drivers/media/rc/keymaps/rc-odroid.c          |  2 +-
 drivers/media/rc/keymaps/rc-pctv-sedna.c      |  2 +-
 drivers/media/rc/keymaps/rc-pine64.c          |  2 +-
 drivers/media/rc/keymaps/rc-pinnacle-color.c  |  2 +-
 drivers/media/rc/keymaps/rc-pinnacle-grey.c   |  2 +-
 .../media/rc/keymaps/rc-pinnacle-pctv-hd.c    |  2 +-
 drivers/media/rc/keymaps/rc-pixelview-002t.c  |  2 +-
 drivers/media/rc/keymaps/rc-pixelview-mk12.c  |  2 +-
 drivers/media/rc/keymaps/rc-pixelview-new.c   |  2 +-
 drivers/media/rc/keymaps/rc-pixelview.c       |  2 +-
 .../rc/keymaps/rc-powercolor-real-angel.c     |  2 +-
 drivers/media/rc/keymaps/rc-proteus-2309.c    |  2 +-
 drivers/media/rc/keymaps/rc-purpletv.c        |  2 +-
 drivers/media/rc/keymaps/rc-pv951.c           |  2 +-
 drivers/media/rc/keymaps/rc-rc6-mce.c         |  2 +-
 .../rc/keymaps/rc-real-audio-220-32-keys.c    |  2 +-
 drivers/media/rc/keymaps/rc-reddo.c           |  2 +-
 .../rc/keymaps/rc-siemens-gigaset-rc20.c      |  2 +-
 .../media/rc/keymaps/rc-snapstream-firefly.c  |  2 +-
 drivers/media/rc/keymaps/rc-streamzap.c       |  2 +-
 drivers/media/rc/keymaps/rc-su3000.c          |  2 +-
 drivers/media/rc/keymaps/rc-tanix-tx3mini.c   |  2 +-
 drivers/media/rc/keymaps/rc-tanix-tx5max.c    |  2 +-
 drivers/media/rc/keymaps/rc-tbs-nec.c         |  2 +-
 drivers/media/rc/keymaps/rc-technisat-ts35.c  |  2 +-
 drivers/media/rc/keymaps/rc-technisat-usb2.c  |  2 +-
 .../rc/keymaps/rc-terratec-cinergy-c-pci.c    |  2 +-
 .../rc/keymaps/rc-terratec-cinergy-s2-hd.c    |  2 +-
 .../media/rc/keymaps/rc-terratec-cinergy-xs.c |  2 +-
 drivers/media/rc/keymaps/rc-terratec-slim-2.c |  2 +-
 drivers/media/rc/keymaps/rc-terratec-slim.c   |  2 +-
 drivers/media/rc/keymaps/rc-tevii-nec.c       |  2 +-
 drivers/media/rc/keymaps/rc-tivo.c            |  2 +-
 .../rc/keymaps/rc-total-media-in-hand-02.c    |  2 +-
 .../media/rc/keymaps/rc-total-media-in-hand.c |  2 +-
 drivers/media/rc/keymaps/rc-trekstor.c        |  2 +-
 drivers/media/rc/keymaps/rc-tt-1500.c         |  2 +-
 .../media/rc/keymaps/rc-twinhan-dtv-cab-ci.c  |  2 +-
 drivers/media/rc/keymaps/rc-twinhan1027.c     |  2 +-
 drivers/media/rc/keymaps/rc-vega-s9x.c        |  2 +-
 drivers/media/rc/keymaps/rc-videomate-k100.c  |  2 +-
 drivers/media/rc/keymaps/rc-videomate-s350.c  |  2 +-
 .../media/rc/keymaps/rc-videomate-tv-pvr.c    |  2 +-
 .../media/rc/keymaps/rc-videostrong-kii-pro.c |  2 +-
 drivers/media/rc/keymaps/rc-wetek-hub.c       |  2 +-
 drivers/media/rc/keymaps/rc-wetek-play2.c     |  2 +-
 .../rc/keymaps/rc-winfast-usbii-deluxe.c      |  2 +-
 drivers/media/rc/keymaps/rc-winfast.c         |  2 +-
 drivers/media/rc/keymaps/rc-x96max.c          |  2 +-
 drivers/media/rc/keymaps/rc-xbox-360.c        |  2 +-
 drivers/media/rc/keymaps/rc-xbox-dvd.c        |  2 +-
 drivers/media/rc/keymaps/rc-zx-irdec.c        |  2 +-
 drivers/media/rc/rc-ir-raw.c                  |  3 +-
 drivers/media/rc/rc-main.c                    | 92 +++++++++---------
 include/media/rc-map.h                        |  8 +-
 143 files changed, 230 insertions(+), 244 deletions(-)

-- 
2.56.0

