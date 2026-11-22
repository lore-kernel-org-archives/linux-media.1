Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795313461;
	b=CAv0XhpeFsXP3se3WpaqgvgE1f9104579NBxOCHqS4muaK4chMzzlEQrglmOIHbLKLkf
	 2i1b3ZPe1byUKBDuyzC8X5Ur5YpeHu/ADCIdooCUz7MX8iN6TVwZVp4i2La5M55zx9j1J
	 ERf9GJlcrPRaHqEoxo8V9MsbiMEMBXUfnnM/sthpn0Ge7dIppJtgTi5Ut8CEv47yd3rb7
	 S+zRK/mAacgEjaF+HhPoICT69b0ChiYbxO+7ztyax5OMlcaeSmjzRDNp4WabB9G2yJEnC
	 T25dbrEMDcKuDQ0kYy1eddApfCb1EH7w0CzHUtg+2vBmaeUtDVNWLSlmnEJvNbJnhVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795313461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=fjSZBrDKFgyY2dEkYo0GGe61uPH3KjDpFZp1Qf75waQ=;
	b=oW07WNQN/o6hh8RmHZB5zcqY3Vs7zzqFh9mep9jH073ASagd8VVi9almqNWIkhg3FF3p
	 cXbJiKCBcMb1wP8ccCnnxE+aej9xcxyvqKuM9Mg8zgEIg2Eg/PWaS3oHC5LKSexYNBjm4
	 xGSGLM57JKapEw0l9rSMmkmAmA/KDI8fzpZn265JZTTV2Ke5w+By0lNEePjZEE7+mRTLf
	 P0t05gqhE76b/sPgYOQkDoKb4ax+9Bo1B+FG8kQljI5uOd9LU+gk4FNrYVPzJF+YBPGin
	 QO0wnlWV7PjVZWYMS+cjbh8hb1A+cPYnZbCTP/VmWsPlBoeiKu0dW9SZ/F1UmoZk7bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DSQqYG1r;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1553606A6A9
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 02:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1553606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DSQqYG1r
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso1411644f8f.2
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 18:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795313459; x=1795918259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fjSZBrDKFgyY2dEkYo0GGe61uPH3KjDpFZp1Qf75waQ=;
        b=DSQqYG1rbxAROFU0MT6qERZNWUoSmGLWo16vyJbO3EfrPBRy8+u37IGQOBPb70h3uv
         WwMQFip6wXQbEIm/EYKUPmBWkrCQlm6T+X+8olNkN8r0PjGAUqUtcWdkZv7i2PHlLK0W
         UGTkBB1Zi2NlEon8T/qat7J9lsKkk65piAEpRrr+NHa81dCfJcqZNSQ6uxlYThLpahbO
         DEDSl2pKYRA3ux3udXKzRyC7O0vDM5tyHSWYtbEUp+TdDN/MAVw93/vy23WyvxC0Usrb
         qXLXDmyEkn725fmyOSJEcTCZ56AXMhC8CsQH8T8RMPw+3Hrbt/1PKuHq2DX7lK+LDIzl
         LmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795313459; x=1795918259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fjSZBrDKFgyY2dEkYo0GGe61uPH3KjDpFZp1Qf75waQ=;
        b=F8zszqCUA+rPsWx/uudN+0DmH/kZYtHOzOu3/ov+XpDE18iZ3O+QWlVlSMAMzIDcj+
         Aaj1uOsmfR1vqPe5Y0KzdPGsb/StWcmxGdbvwmKeAo3VidGRQRmyLqXwbeKZLmEGri9t
         IsWNpGn6vnnxThBPJaELqcQ1c0lHxxI06KfapEH+yjr7C/DxAeBA61qjmBVA8rYiHIdU
         hu6Z3jJhZ4jUsygNdpBFb286D0HH4M+I3gpQwqkebTLqjddUI/SEWvQK2//unMA0hPzQ
         VgGpFSocbkNWKHpmCBm5LkYqau9m1pwmNnjqLGGs8z1qZNwydOcBpLyc/UTp0cIer3oj
         wVhQ==
X-Gm-Message-State: APuU4Z8+q00jfZASL+pfmLLNjsXlOIVxQB3ZQbk9C+nzSuNB0YO1qtTB
	UgSnNyysVBdE0ZOyvlalM2rMvkeGZETtzQbVeEISXTK4lXpBV8apcmi32qBeBE5bNB/ybgylJZX
	8z8jiLOs=
X-Gm-Gg: AZFdTZd89+W26X8Uas9dFB4huu5fMA0pecyryAP5GwkCld3IEKt6IDoVMqffPeMPGk9
	xvgRBxKAZhofCauPcLH14oQKFhiH8AcfR0GuUxlOhZIwAKbqEpZ90x4lS9x161tOrUkXa3PxWOq
	rL0M3d/9iL3KjnNNW6bFQBPLiyb5DTRtXIe0z68Cv1FTTSVCs5oNkUqRKf4THdRrTWjKSoBO8Ou
	MnP5/pObBbdSZX6VJdPTtXI7GK8i4wzl5R9Ca49cxZSOdElyXKtWhPywMLn/kMHo0SHb90k2TM/
	GqYO67QGdSiUqXQeS5H2L+GYkDnTou4tQilVbSOY+vL7Bpm5p8XaWbjuucvcZGBPhjLrtwm9Shn
	GpNERcm6UEjM9ONnqwCn8kaBPMCL2wTsJx+Mjn55uEj391samVR2xlyecoLoJvcTg0aPbQnLNTg
	PnH6tsUmxilDdIEeU5hsABJoCKev2FU45Lb6PCcQlkIrWIy+GkWAudSDuYZGAuned9hFmMHgDcZ
	TDtpKAwDcXqqminSLi/AbWfAlWBlK49wbMnd8V3LKvGwrjwv/jLSL5I55OEDfskTX54nRL/bs0a
	tmAskCsRebIjD1rFTmO65XXC9+YENPx5L+V9U0EGNA==
X-Received: by 2002:a05:6000:3107:b0:4af:e519:cccc with SMTP id ffacd0b85a97d-4afe519ce74mr4819970f8f.12.1795313459221;
        Sat, 21 Nov 2026 18:10:59 -0800 (PST)
Received: from [127.0.0.1] ([109.76.78.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm14822085f8f.2.2026.11.21.18.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:10:58 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Sun, 22 Nov 2026 02:10:50 +0000
Subject: [PATCH 3/3] media: qcom: camss: vfe: Eliminate ever expanding
 src_pad_code switch logic
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-camss-routing-fixes-v1-3-0deeeaca2622@kernel.org>
References: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
In-Reply-To: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1571; i=bod@kernel.org;
 h=from:subject:message-id; bh=kbhtaYYTdFf8+b92Inmn8UijKqhmvfcr5MYTlK6RLis=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrAk8quDuanOu+l431p0UPeYlzincFEfiMSDQnT
 Xp4YtkDT3SJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawJPKgAKCRAicTuzoY3I
 Ou1DEACrUDvqsMKDkk+SQ/W+21Acy1rn740yOwpLgQS+ygrPqhtjCPASAOiO/QaTN3XWa5GQI3n
 9U0R993MyklBnL+cWuvb5fwS4XhiAi0IvGfe76EVBkNSfaFn6ISonuey+9p6JUvr1d7XSUV+Png
 cJgHpBjtqRmklCHcwlY+OHkMHKtVhnUkVdOnDKmeggPPl4DDecnG8RSrQfnQj99WjLN9L/yk8Zu
 wj32NSk5yGVNIEQvlI+knHxea0Oau6KEAlCIaLw2kRCUFBNouoT7XTA1yJNtvzey+TAbAA75sD4
 c48lP5HA8XUVBzohNaBNEJZkC7/sZ9L7NFWE0u35z3cvoFVsVXgOOcyNjuAYSfJ93TLx9/anjMG
 aNFTQyfGCZC3pqvS/ZAJKN+86z8/XXsrIkM3PunFw1MFS2QmrhW+9qyiCAuRRy7alRo7LVQVgfp
 qUba2o/UI+sDZFHLpAX6oP5/EcdaK6pB2yUyHb2bNlcOUETcExuew7tcYx9p0nhHUCr5ehc8sf9
 Zf9RqvBio1roSCPDZJgE2j1zwuzKKctsiyPXHcf31mwfIePT2UnJsU0KYno6X/W3aUtE71Mcaxu
 jWD+cs3Ulqd6q78FQvlRRZR9HaGDYThbbIjd7z3i3GJV5CJhRkOkKsncnM+sKV21ll/uOdxMmhJ
 CQE8w2h6lcQZoQw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Every time we add a SoC the src_pad_code switch statement is expanded. This
expansion has continued to the point where there are more SoCs listed for
what used to be the exceptional state, than the reverse.

Invert the logic. The exception to the rule is the old SoC set there's no
purpose in expanding this switch continuously.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index f9bd2367671f6..10ad862ff5010 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -340,21 +340,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 			return sink_code;
 		}
 		break;
-	case CAMSS_660:
-	case CAMSS_2290:
-	case CAMSS_6150:
-	case CAMSS_6350:
-	case CAMSS_7280:
-	case CAMSS_8x96:
-	case CAMSS_8250:
-	case CAMSS_8280XP:
-	case CAMSS_8300:
-	case CAMSS_845:
-	case CAMSS_8550:
-	case CAMSS_8650:
-	case CAMSS_8775P:
-	case CAMSS_KAANAPALI:
-	case CAMSS_X1E80100:
+	default:
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_1X16:
 		{
@@ -415,10 +401,6 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 			return sink_code;
 		}
 		break;
-	default:
-		WARN(1, "Unsupported HW version: %x\n",
-		     vfe->camss->res->version);
-		break;
 	}
 	return 0;
 }

-- 
2.56.0

