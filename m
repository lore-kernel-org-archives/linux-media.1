Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795031513;
	b=d7YG8zpfCC8d/tcUnQAvoYgyW0Ig/uHeQB0vmoAlz3NbOnAxcgw4fpei23igQ/HyxH8m
	 RMJZc7Jl8FvUHerhZcY8CeQbMfVBLMmTTP4X2xSerj/wh+b8a5C87bpD1oJDgwilkiyQl
	 HsIiYgk1rIyuWbyrgSmYTW0nZW5PfbpItjKe4yx1gr1aMp9asBPQ6m1hE2RCyR6RYUcr8
	 wxWmUAszUnUZb7D+XUjl3Uf2/MOPbzLXbiGcH15EEUwHAJu3yqjS0XhJn+Joq7DH30HcN
	 eqF0aKmrm8kS2mIih4WIkdBOpxohK9LcXeIEnotXAO8V+CmAOiC+RCTEqYExECfOwiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795031513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=u2pWo1k6VdDiNoIV1DHvLxSWgtzgZlC0d9279vJ2m+w=;
	b=A9+t2uRIUncaqhyHCOy75yWT8Pkfo/DDPTCKOrPl79RYP9iJRq+qmOT5qGhEcl/AG2jq
	 dkSa0KFnvUNhtb53PDkiyTfshAcUxs82/dgJKfjqUDNZA6xrP5erDuYfnimegTKNXHAtJ
	 zhYbN13zfu0vwuZGimoYsvoHReRAJfSZ4F+jHt0tAaFVletcL6EDinIoNdelaqlLFAZiF
	 vHmc5nZJ8zXVxvWw6JHDg5sF20fWHPT6YNuARR5J0gm+LfplrKyXlnpziTH591ynRjgp4
	 0mRtWpPhXWeAZf8bt7zoFePUXQCowq/Gxh+HM3oxb9v0hk6kN3U6+Bml/2lVAMaAMAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cb9hOOdu;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9841A606A320
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 19:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9841A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cb9hOOdu
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d05d51553so10642695e9.2
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 11:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795031511; x=1795636311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u2pWo1k6VdDiNoIV1DHvLxSWgtzgZlC0d9279vJ2m+w=;
        b=cb9hOOdukV1fmXVjkDW9YhdSXYFxEa8vXloF53g/mw4wP0q+A1W8jaCsfhPdMaadjk
         k/c5KSrAYLbENohdCbNW7AEqx76om/CafjUc+3HJG2BpU3Vf/qwggQzrHB0V64Is7xKL
         n55MZoDA3XdGOva7PwjAxrwKt5H0Lux5kiM3MLiE0WBMEw/9glMChnveVl4AZR7X2GNi
         nNLL/tPgOsEI5GDkZ93aD79GImF/tpg7chHv/aTPcWWcIy5w1Sl90wB2SbMzzvynD/Do
         VJKczC1ePG8ZbWpbuOfuM85e00GuKRsFCPbbTHrZVLUdnlrebrBAjb0jOzdF/T095p41
         xKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795031511; x=1795636311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u2pWo1k6VdDiNoIV1DHvLxSWgtzgZlC0d9279vJ2m+w=;
        b=Ci+NwYS97R+PMnR3PZa8RCeEbibUlZM7u41kAAhsYO67uRWu/ZYJdgNn4zqSW6Upoh
         XcNjVzK74fMGATyCew75MYj0HskThCIF0Bkw7XcKHrfUsTAucymo5+pqm6FsdiGcPTuc
         ulRDuR2pAZMmsQtWNhlENvTd1ciE24X/ebhoQpAwDlg8sdjObMmdB0vCkxEgByPy+F5G
         noL3qikWWwWlNM2mqk8rl7kolVLTS1jBNJzfEm+Gdky/0D63pDsR1xti13zA5bm9QgIm
         tRbW5xIihrI2ZML6ndXkeNgiLDUkcuUWqEPASSvbP6W30kaaBF1iiSrxkcRXaLADdBPh
         9cvg==
X-Gm-Message-State: APuU4Z80M/9wX08eMcKrPITNxeDP+ykorRAqGVGIul5oHC35w9WDKkVi
	vQaZTv1y77GZbq/lVxyv7MUPaD21y8vb1zTCdkKug7EpSv4bhyPnNCKOCqa0rg==
X-Gm-Gg: AYBFou2guX7qAGEDRKpIHTX+sckd4N+66azhtIO2eqElro3zgF5rZ3315HylL38ZE4N
	3Iu95sSm9uolufCvj6+CjJK2f6eA37QWABzCUEWshDH/Fm1iLL1/VBIbdFWW1RGaF/5KkA73Gxq
	rOCBCDVb4RMfA6e6+06t7w3v1KxZTA1GPy+O9KxBQC4fSUHD87XTzVYsjZ/SKZ0qhTZ9XcaUdZa
	in4MCcQp+5RQxFd/sGrjgUJDEyyT2wZ1Ky/4vBS3mY0k3Okeoloh1dc+DGWO5r0ONWav2F7IMuW
	lAmm44KNOYN0juyOXz4gjiNPGuZE7s0xbu1Soi6+eXgq5ZK4oAtMMTDclJuHiGvsBnH+2nyzpNt
	GQ2SRbnLY+J+C3f4yAldHuPjqmHpjYBufnF+zLMMwDf7546c4EyjhPKPK0VhLeJ8ELw28bIaUc3
	tVIOqQE9FLjGxVFx+6sPMBx0oA8I22z8gvINJTt3igJEM96latiLjiu0tjc7R0qBHVVhuIdLHlG
	oapU0DxAbPImd1KOWkcxyqHa7dxEOiahR3RYwFoUc2IHDoxXeCA3eulI3dCSxjah6H0TV4QLRIT
	ZWAik55DcDSjR8BPo0P+2KSzaYBKm9US/RCZMduw/Mf9HdtvkZgEbcl39uUU7hvqMektdNLcrfr
	qSgkP1vWboxMW+L8O5A==
X-Received: by 2002:a05:600c:a41:b0:4a1:fbd2:f689 with SMTP id 5b1f17b1804b1-4bb7da13ad8mr74172095e9.7.1795031510930;
        Wed, 18 Nov 2026 11:51:50 -0800 (PST)
Received: from Enricos-MacBook-Pro ([2a01:4b00:b82b:de00:c5e0:cc6:391:83e5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d4f5b87sm60555095e9.2.2026.11.18.11.51.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 11:51:50 -0800 (PST)
From: Enrico Lorenzoni <enricolorenzoni59@gmail.com>
To: linux-media@vger.kernel.org,
	Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Enrico Lorenzoni <enricolorenzoni59@gmail.com>
Subject: [PATCH] media: cxd2880: fix carrier offset for negative raw offsets
Date: Wed, 18 Nov 2026 19:51:35 +0000
Message-ID: <20261118195135.92439-1-enricolorenzoni59@gmail.com>
X-Mailer: git-send-email 2.54.0
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

cxd2880_tnrdmd_dvbt_mon_carrier_offset() and
cxd2880_tnrdmd_dvbt2_mon_carrier_offset() scale the sign-extended register
value by the channel bandwidth:

	*offset = cxd2880_convert2s_complement(ctl_val, 29);
	*offset = -1 * ((*offset) * tnr_dmd->bandwidth / 235);

tnr_dmd->bandwidth is an enum cxd2880_dtv_bandwidth. It has no negative
enumerators, so GCC gives it an unsigned underlying type and the
multiplication and the division are done in unsigned arithmetic. A
negative raw offset wraps before the division, and the function returns a
value near -(2^32 / 235) Hz instead of the real offset. The DVB-T2 variant
has the same expression with a divisor of 940.

Positive raw offsets are not affected: whether a receiver hits the bug
depends on the sign of its crystal error relative to the transmitter.

No in-tree code calls these functions today, so mainline has no
user-visible effect. The bug shows as soon as the value is used: on a
Raspberry Pi TV HAT, with the functions wired to a debugfs status file in
an out-of-tree build of this driver, 8 MHz DVB-T muxes whose carriers are
about 2.4 to 3.2 kHz above the tuned frequency read around -18273794 Hz,
and a DVB-T2 mux at the same site read -4565734 Hz. A user space model of
the unsigned arithmetic reproduces these readings exactly from the raw
register values.

Cast the bandwidth to int so the expression is evaluated as signed.

With the fix, on the same out-of-tree build, the same muxes read +2.4 to
+3.2 kHz. Detuning one DVB-T mux by known amounts between -100 kHz and
+100 kHz gave a slope of -0.9998 Hz/Hz, and a locally generated DVB-T
signal offset by -30 kHz to +30 kHz was tracked with the correct sign
over the whole range.

The analysis, the fix and this changelog were prepared with the help of
an AI coding assistant (Anthropic Claude). I have reviewed them, and the
tests above were run on my own hardware.

Fixes: cc438de9df2c ("media: cxd2880: Add DVB-T monitor functions")
Fixes: 55e13167c938 ("media: cxd2880: Add DVB-T2 monitor functions")
Signed-off-by: Enrico Lorenzoni <enricolorenzoni59@gmail.com>
---
 drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt2_mon.c | 2 +-
 drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt_mon.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt2_mon.c b/drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt2_mon.c
index 4e173dd87..e35efff01 100644
--- a/drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt2_mon.c
+++ b/drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt2_mon.c
@@ -146,7 +146,7 @@ int cxd2880_tnrdmd_dvbt2_mon_carrier_offset(struct cxd2880_tnrdmd
 	case CXD2880_DTV_BW_6_MHZ:
 	case CXD2880_DTV_BW_7_MHZ:
 	case CXD2880_DTV_BW_8_MHZ:
-		*offset = -1 * ((*offset) * tnr_dmd->bandwidth / 940);
+		*offset = -1 * ((*offset) * (int)tnr_dmd->bandwidth / 940);
 		break;
 	default:
 		return -EINVAL;
diff --git a/drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt_mon.c b/drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt_mon.c
index 86d5a1e40..c07949b11 100644
--- a/drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt_mon.c
+++ b/drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt_mon.c
@@ -184,7 +184,7 @@ int cxd2880_tnrdmd_dvbt_mon_carrier_offset(struct cxd2880_tnrdmd
 	    ((rdata[0] & 0x1f) << 24) | (rdata[1] << 16) | (rdata[2] << 8) |
 	    (rdata[3]);
 	*offset = cxd2880_convert2s_complement(ctl_val, 29);
-	*offset = -1 * ((*offset) * tnr_dmd->bandwidth / 235);
+	*offset = -1 * ((*offset) * (int)tnr_dmd->bandwidth / 235);
 
 	return ret;
 }

base-commit: aa0f4c41d4870a18e65772a1817af16427200371
-- 
2.47.3

