Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795415878;
	b=rg/RU/eD5nsBQJQm3O3fV4B7XlTtbOnjzKp849+oc7T5VsHm69vIHFKN68LG82/pkMsQ
	 Sqo+zP/tJl8RFH2rvgJWCWDXg0nQrKHL6exXiP8jttM0oKW28ADVeGywqlF6Cu+5i5QmK
	 ex3w4/4UR8SYhT3uDlQLLQpq/elmXBXLSC0rk45b8f2ZUGQx/K8hhR5VgUOjdDgNRAX4/
	 7Lm4FX7MmXbHEMuE8aScT17W4bQFjsL+p9PQXEGdZUc+s3s8OlUCxkTJMJtg9OF4S5QcK
	 cVfCr3kNAz4Cf3UnxLcOE8wygJapV2rtBGXiYCBDGZCaCAWUXiNERpSa6DeVALMiJZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=afbt2rmomwUI+307ATY0ZNant7Tutup0OxSCpoe3UL8=;
	b=KIz7RNp94+jcQGuT8OPJ9toIFyNWuwmN6YseDZyf6ptSCUT0E/A2JvIZs4cCCD22w6R3
	 AuvV2bnbwFu7jnPXljlLBaLEDkpx6xx32GApSphhgqtouu+sra+JRvTxy+h2wFRmwjxbx
	 EZiAgkYnqMbvK9Cc3KnzaPvL5UPUfd0YKpKOpmppksSM3E3q47pVCOTmBZkUmBiJjy8Lo
	 +qol3W8SWTvHfsVPKftS+whwQLc+DsDcyhxEi46J2XpF/w8nBvwNjQcvRn9NBJXD93jba
	 Af3B5Z+J9eYhtu8t6hC064xfznxg2oHPHwED3JHRCXdRBEYddiEOQzdSOgy0bu4Ye9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HF8ETJgy;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7801A606A32A
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 06:37:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7801A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HF8ETJgy
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3acec6677so4121546c88.1
        for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 22:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795415877; x=1796020677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=afbt2rmomwUI+307ATY0ZNant7Tutup0OxSCpoe3UL8=;
        b=HF8ETJgy3K3P7rv90VlZFwWi6J86eea2v2fnG0piKVB5kjIpj0a0AQ9G7cHH7YngGz
         KXfKEwtvjrnuQZtt/HZ54IUDoUm0nwhMjsgTAn8+A7vUYiARe/zVs0WCd2Cb4JAb9k2T
         k8fgvsLynXsXqE2U/hGr5zmeZHCRiuHHDIPJPEOQh4D7Fus3hMMwWdKx8mOUqvuquXFI
         iP8TvCgSp+qnE00Vx/he9GuRfMQYyzGxumdM0f+DWb3gilrBstStbjI0qyMZHq4wsm26
         HGvDecJuiGSpyMatqkkTWh2l4vN5DBG3rPGGlQB3nxr3P7+4+7kUKgqAAuBLLny2pJoi
         xJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795415877; x=1796020677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=afbt2rmomwUI+307ATY0ZNant7Tutup0OxSCpoe3UL8=;
        b=P/lpY7c60WwajPcB4TVn0Wlr2zLRQ9KUsOk9wtjOzhf0kvFOa+qtj8+cWYjtdZBtvv
         B23TOZbXauejZxB7eRNQcDoUrdsqUKbAc9YJu8SCFckBEqSFzFvVDryQR5yUTchsDXKo
         yZcjYIJSOdN2IwxaF6ITGYNM5nn4PMC9hK0ptFVtIvIwFpypVO0VtsTbvjCSruaq5Rkb
         HfWUsIlMASOHPxgXbEPFVtByH2k3JJb1aCL5v4q8hfFhYgS8sXLIz7ObKSubkw0CNbED
         fBP/Iqyv+3F0Xeq++scWsNTV9gfFMGdzlujp0AM2GK8efd51W9RTlumP/h1OkvU0ZD0c
         e0Pg==
X-Gm-Message-State: APuU4Z94RVxD2Mr+HuuoNpcX9y6NN1XlNgtJ0G509dGaDhirwLXcqDre
	VA1IykYYGmK0Y5YB4fMI67DTmwEKcOUXf/yteu2pV1Dwuilrf2K6pEEeV91x96of
X-Gm-Gg: AZFdTZdENknWn80N1zYaxau5DLTnL8jCyACPqlvDkeS4vM3vuIrIuq7MkieMna7uSxI
	5PD5E64HTM5NShompaIbwc+pGF03Hsag70en3DSKnsBdMOpJAkijlZmoKPSDNcl7v572wRk1z/n
	ob4K0n/3potIwzH7o+2hsKEgmQ/ApucSa4Fh8L9kb6ZsiDWEiwFqK+gOR6RcW31GR4i2rksnicY
	D47cy2kYa9ruEI17UFSQdxNzkk7x+8CIEwFjwodlF4O1sLbJMHTy1hgOCbD8Fcv7qkb6lw+UOzd
	inT73hNnBr0N4+lU+9ZonazFcyjAm4AY1uq7L5ItntXBZ658bdFcCSHFMAw+O1Kntse8JVrWmjW
	8ordtjpHc+DrnLX6HURveVEVs2khai9GTnNr7n44caQ8i3Y5NBA9DEQSqt3pN5nIpYRMQtChSO1
	DfYGRtEBQ4DYMNWy3yGBHhHy5+rQKiAEfAnsje/mVhdS9mxDWCv499gkK3UC1PcJ1rK8VpkTF05
	2twOZSXgvcDF9MaKvWmL5XvVdb5tvd/oUHRDLIzlHOU/K0ZM3wlxtU1i4G3Mu+4MtxuXTp5ah8u
	BWajAr9Zd/5NzOuRkYEYlsyOaVSSZ90B7tLORxnEPmNaEGMdoy6qbsFiXDhK55WSTWdUt4sOXqp
	qsKjy8fRpbG2jkrYL9L06+Kg+w7hszfZ5whaITWoDIrg0
X-Received: by 2002:a05:7022:f106:b0:1b3:afa2:2d7e with SMTP id a92af1059eb24-1b5567dab3cmr9096340c88.1.1795415877349;
        Sun, 22 Nov 2026 22:37:57 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:a7dc:f03c:3f60:caaf])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm35934568c88.14.2026.11.22.22.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:37:57 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>
Cc: Ho Jie Feng <hjf3108@gmail.com>,
	stable@vger.kernel.org,
	Ho Jie Feng <hj3108@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: dvb-usb: do not clear the raw IR change_protocol
Date: Mon, 23 Nov 2026 14:37:31 +0800
Message-ID: <20261123063732.1615570-1-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Since commit ec7cb49871e5 ("media: rc: Fix race condition during
rc_register_device()"), rc_allocate_device() prepares raw IR handling,
which sets dev->change_protocol for RC_DRIVER_IR_RAW devices.

dvb-usb and dvb-usb-v2 then overwrite dev->change_protocol with the
callback from the device properties, which is NULL for raw IR devices
such as rtl28xxu. Without it, rc-core enables no protocol decoder
when the device is registered, so keys are no longer decoded.

Only set change_protocol when the device provides one.

Tested with a rtl28xxu device.

Fixes: ec7cb49871e5 ("media: rc: Fix race condition during rc_register_device()")
Cc: stable@vger.kernel.org
Signed-off-by: Ho Jie Feng <hj3108@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c | 3 ++-
 drivers/media/usb/dvb-usb/dvb-usb-remote.c  | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
index bd86d25043..218397cc68 100644
--- a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
+++ b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
@@ -149,7 +149,8 @@ static int dvb_usbv2_remote_init(struct dvb_usb_device *d)
 	dev->driver_name = d->props->driver_name;
 	dev->map_name = d->rc.map_name;
 	dev->allowed_protocols = d->rc.allowed_protos;
-	dev->change_protocol = d->rc.change_protocol;
+	if (d->rc.change_protocol)
+		dev->change_protocol = d->rc.change_protocol;
 	dev->timeout = d->rc.timeout;
 	dev->priv = d;
 
diff --git a/drivers/media/usb/dvb-usb/dvb-usb-remote.c b/drivers/media/usb/dvb-usb/dvb-usb-remote.c
index 6dc11718df..f5f30d714e 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb-remote.c
+++ b/drivers/media/usb/dvb-usb/dvb-usb-remote.c
@@ -277,7 +277,8 @@ static int rc_core_dvb_usb_remote_init(struct dvb_usb_device *d)
 
 	dev->driver_name = d->props.rc.core.module_name;
 	dev->map_name = d->props.rc.core.rc_codes;
-	dev->change_protocol = d->props.rc.core.change_protocol;
+	if (d->props.rc.core.change_protocol)
+		dev->change_protocol = d->props.rc.core.change_protocol;
 	dev->allowed_protocols = d->props.rc.core.allowed_protos;
 	usb_to_input_id(d->udev, &dev->input_id);
 	dev->device_name = d->desc->name;

base-commit: b7ac871daee981f1963f632586ff9b9d898ce5dd
-- 
2.53.0

