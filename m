Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478706;
	b=U1UXUZ2PKrIcKW/2oSFE35YC/ZIfVuWkhIiQmEktH/2J8hs7+9IetSc3R4zbXr9B7mML
	 mCjER3VvX4SbHEiukBzYckjEPxmM0xeK3LMMsoXTUsaV1DsDVbhtkpLyNiaD7pyZPFhCw
	 D1ZatTbspqAiQyuM26cPYNegAEtKt2wljWCnnCq4IFjl67wAm8nrXSLJwymUGu7TZFEpT
	 9tHpOazpsKOKcfF513fWju3IZyE38BgbJaunH6ncynvvL1IE/eNFCQdHwojPDeH8IaMe0
	 DYl6jaQOAASU14R9XRM0d87lg/czftBTjpCJhUE016c67Q0zUUJjVqz83oglKbsvl4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=pDRUb4e0HFI/8KX/ujmfHEnemDtdXuv4ZVAssKD7jk8=;
	b=fvHcEwjLqP8V/LlGb4MpbgRTm8ir+a8n765OaCOocACMcnTTxaIV/9Gk6CgRfWUOxf6z
	 koAX8HiuahCU7OtMmj221kU5dS2mDCs4B8xflQb5eYG8/KnRzNULsaNHSbwDbyfDskkfN
	 aY3Rwl4I8AENvCMtNOgqqb544ytWEylvfYHX3MIkCGd073vMEC7FSlZe5lQ/f6EaWlszj
	 5TImRSIIQafpZuwfzg4CosK5v/1YDDsbSefvTWD7gosltTtfajMX2rRLDGPMje/CVhhx1
	 aHQIqwxNLpChzgFVKrwvSsYdlZXQiwXeEbjDjK2htXrf/OrkiopG/0xuiHb7T5DW+sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gV4ysUBR;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445A2606A321
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 10:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 445A2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gV4ysUBR
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso42946435e9.1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 02:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794478704; x=1795083504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pDRUb4e0HFI/8KX/ujmfHEnemDtdXuv4ZVAssKD7jk8=;
        b=gV4ysUBRVbQZKHjoc/YPy2id5EpTXD6c6VN1CyfZWgJ2IhCvL7HHO849btJl+kf1pG
         eM2k8KkuCuSRyKE2m+2vvcgQu9MtfcoC1kb4mfsDVKtAkqpe69SdicxmYIWHEAVt+NjH
         KmIA20n4LqrykNwOGSahOltANZsZVdIMU0ycK81MGUNtO0XOPOOKyERaxdu1xXQPxYEh
         euX17hNLHyBQFbcTeeoKgwigg//4cwJIHY4JH805lNA9y8Wr2lUvgusMGOv+MENT4Sw3
         S5rl1w9VoM6uQ+Cz2OP/77rEeqF1N8CNuJvK1dhnu3M963h3eVPGGmIuvQxuAtivzeHU
         ZJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478704; x=1795083504;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pDRUb4e0HFI/8KX/ujmfHEnemDtdXuv4ZVAssKD7jk8=;
        b=qEy6HanGgGght9WU8SfT43xMGzs5AD8e1hUZ49SHchaxY+6yuh2xWk9zU3WkZnaseF
         p8kPmDAbvdJRIQIetsrHESSUkaCoJOk/X2lvYaNno2UuUnjWIj08YawrjPqHVtlqopGg
         9Suw5VhK41Cp91wAlsVC+NmAljRXvA9ugyQFeWHEsoipt/u82qJdSIuUQ9j/8yiNKr5W
         qmKGhZWBZDuW1X6K430ZH1f+CCEdQvJ8k+2nTvnV5b55G4L3lD79mk1RjVlh/onuw00R
         LO5ti1QPR/ZRVcplFZ1dbD6siqQFTcTqS32lnrr0AMwKiRnk6Zp8mMrB3NT1vymuJCrf
         woog==
X-Forwarded-Encrypted: i=1; AL+hErGInUHoivwbpIZU6lq0GgDoxKmTIQA6Tinrm28iotg832o/gjw+9ekYxOCgQtD8W4+C6uunTlZYYcP4SQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z89UQ+RjprNJsj+O3Em9szJS8V18/QYU2IAd9XCnjw+irlVbSnI
	yiCwLUwKFsIzYMKq8OlHIMjlBL3J3li51uY6otwLjZM3KZCCggSTqafqQCAeRPNH5oE=
X-Gm-Gg: AYBFou0X+cUFNYIJIjBbufTPx9yE3W3uuoODPyVJr1Q+Vr88HicWhNxXN2C3aJ1/Lvl
	OKE0yZrEp2VwiCjNSsUD9UxvVBRxpFBNZGko1OeRW48sMT8YCDkU01FJzpfKKL0sTVcw5CAvuU8
	8pUSmPoKKbyFyopCB4swn/u+zK603/1kGAh2yP8ikuUrcsF0fR407X2AeJERjrMpxGHQU/TScbG
	qLR+EdBEuamqgb+0loh2lfenwUv9bE98aWcTNMNugILebUjLEaOQWLb0xst8NfkaPRnuiih+Dw8
	EzrmU9LJhyuezT/GjEeeMU5SJBB1OftLvlaWl65CeX2gzWIdJCfglQMZCfxGn6Pv2lvpVcX13sA
	FktFoJR2jQE+wTm5kgiwM4W5uaveCExlsAqcsxmV6dkW1/y/syov4IyqsG4b/FTd6bCyM5f8ODP
	IDOD0mCmBZENEL01+6CXsSuovKUiMWiK4QWptlUlfbzVD09s8rpijiff4qhD4hzF2PvwVESgoPc
	O1EXgtVM+zFlOhWwJgMMcgwePtCphyekr7XIiooNS3D6Rt/UjWRHDAA657+DuEeJiJ6DlTxBD4h
	XtuxB1asF645OK5+SLYwToSqY8T2N5zQZBAQf4W+BjnO8YvXFcA9Ll9vezL4utI0ixlHRKDx4TQ
	w0DqNUwp7JAMfndf9qH97nYUuv4w0TWRavE2mkg==
X-Received: by 2002:a05:600c:3f16:b0:4b6:bb67:bb9 with SMTP id 5b1f17b1804b1-4ba093c8e2fmr85769335e9.29.1794478703668;
        Thu, 12 Nov 2026 02:18:23 -0800 (PST)
Received: from localhost (p200300f65f19a904528996c8ea0fadad.dip0.t-ipconnect.de. [2003:f6:5f19:a904:5289:96c8:ea0f:adad])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba0953d26asm71053955e9.4.2026.11.12.02.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:18:23 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Stefan Richter <stefanr@s5r6.in-berlin.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	linux-media@vger.kernel.org,
	linux1394-devel@lists.sourceforge.net
Subject: [PATCH] media: firewire: Drop <linux/mod_devicetable.h> from firedtv.h
Date: Thu, 12 Nov 2026 11:18:15 +0100
Message-ID: <20261112101815.2772413-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2582; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=UOhtWXNPyBaqoCv81IWoCC1O0d6StE1JJ156ffpDZQg=; b=kA0DAAoBj4D7WH0S/k4ByyZiAGr1kmehS3iyD16Jh3RzUOGjkPEi/f3Nk5pX2jNRQvEa1PomR YkBMwQAAQoAHRYhBD+BrGk6eh5Zia3+04+A+1h9Ev5OBQJq9ZJnAAoJEI+A+1h9Ev5OEmwH/2RF Ns5NTiCY3th/E0TzqBa2kOObABRTNMqbR94zztsMKFcIjhkLsmuKWrRKw8wWjanHAae/S6PRvQj cWkrOIJxoqTI06ildY0s5f3u+waAiBQVKjC9odEJb9SKyu8imeELV324rHRfrvj+gRvlXwl5bie mfZl9AZ0EnboqRuTc8eGMEpNrzu6OmXSU4hGtWiWatbNLPUBu9ARo11vJ2JEhv2dO7ZRvz5TVSL cqyQoCFPgGBRMCDWGRAA/t+Wa1Zuj/T0MwpeAsDgFSI2nblPsoTRut2hcd/nrlPdpbduzDuGJBG RXhuyPj3vDwsauNd9hKg/ySs01USfjsMMuvZQAI=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: quoted-printable

This header has 6 consumers:

	x$ git grep firedtv.h
	drivers/media/firewire/firedtv-avc.c:#include "firedtv.h"
	drivers/media/firewire/firedtv-ci.c:#include "firedtv.h"
	drivers/media/firewire/firedtv-dvb.c:#include "firedtv.h"
	drivers/media/firewire/firedtv-fe.c:#include "firedtv.h"
	drivers/media/firewire/firedtv-fw.c:#include "firedtv.h"
	drivers/media/firewire/firedtv-rc.c:#include "firedtv.h"

In these 6 files and the header itself only a single device_id struct is
used:

	$ git grep -oE "\<(acpi_device_id|amba_id|ap_device_id|apr_device_id|auxil=
iary_device_id|bcma_device_id|ccw_device_id|cdx_device_id|coreboot_device_i=
d|css_device_id|dfl_device_id|dmi_(device|system)_id|eisa_device_id|fsl_mc_=
device_id|hda_device_id|hid_device_id|hv_vmbus_device_id|i2c_device_id|i3c_=
device_id|ieee1394_device_id|input_device_id|ipack_device_id|isapnp_device_=
id|ishtp_device_id|mcb_device_id|mdio_device_id|mei_cl_device_id|mhi_device=
_id|mips_cdmm_device_id|of_device_id|parisc_device_id|pci_device_id|pci_epf=
_device_id|pcmcia_device_id|platform_device_id|pnp_(card_)?device_id|rio_de=
vice_id|rpmsg_device_id|sdio_device_id|sdw_device_id|serio_device_id|slim_d=
evice_id|spi_device_id|spmi_device_id|ssam_device_id|ssb_device_id|tb_servi=
ce_id|tee_client_device_id|typec_device_id|ulpi_device_id|usb_device_id|vch=
iq_device_id|vio_device_id|virtio_device_id|wmi_device_id|x86_(cpu|device)_=
id|zorro_device_id|cpu_feature)\>" drivers/media/firewire/firedtv.h drivers=
/media/firewire/firedtv-{avc,ci,dvb,fe,fw,rc}.c | sort -u
	drivers/media/firewire/firedtv-fw.c:ieee1394_device_id

struct ieee1394_device_id is provided by <linux/firewire.h> which is
included by firedtv-fw.c.

So <linux/mod_devicetable.h> can be dropped from firedtv.h.

Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@bay=
libre.com>
---
Hello,

this is part of the quest to get rid of <linux/mod_devicetable.h> which
introduces a big bunch of useless dependencies.

Best regards
Uwe

 drivers/media/firewire/firedtv.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/firewire/firedtv.h b/drivers/media/firewire/fire=
dtv.h
index 190bb1a57079..428f9403fd2a 100644
--- a/drivers/media/firewire/firedtv.h
+++ b/drivers/media/firewire/firedtv.h
@@ -13,7 +13,6 @@
 #include <linux/dvb/dmx.h>
 #include <linux/dvb/frontend.h>
 #include <linux/list.h>
-#include <linux/mod_devicetable.h>
 #include <linux/mutex.h>
 #include <linux/spinlock_types.h>
 #include <linux/types.h>

base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
--=20
2.56.0.rc1

