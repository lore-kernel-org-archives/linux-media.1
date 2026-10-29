Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292861;
	b=Ivl5qbBuvb3/PK4doF1am9uUXHLUWaNRK4ODAu5P6yO1txJ3U7pH7C1FzfM6grBGj4Kp
	 KtZidOQmej6GAvBgITaiZ0InNnVoUBSiQM2PP6zTvN34DaEWjGE3gIl+t60/o1PyUssvL
	 mNms4DmUqH2iPDhaZal4Y8t8e4Jje71jOxsACpa1IMbmOUIokAXjUIbHhsoe+J0IILpbk
	 PA51R8WAt2PT6hrEL6EzQtBOtadxOB6jH60xsDa9XYqzuvdfTYasx/oou6KgwfR4sglU1
	 PBz3hcikByCuaHuX84u+6tdEa0lgvqT3v5YfliyNlm39UoXMUb1T9aPG8bNe566OgWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=rWfNIvd9KHSVhrKI7F5X/cP2Aw32Q6yFR8REkiH5EXY=;
	b=X6ggBeB/KpyqnWl+mzlKuddMRTqt0nL7nItw2vYlfSMY4OeLSjRVsByrx957ut0FaWdO
	 Qz04u5lKiMgNXJDbL+Mfa2/YF6AdTS0yz4ezFFpC2ZgBLN8QlB6GpvB7BtdUk4tBWyKey
	 R22y6PnN6U0k60dnJ6L0O8Ojv6aLnomooe51yJIAK28j0MFMF9z2dpNAbGOhFqNFxsC7y
	 En8yRJG6uQMdBaEgfs99pnX2nEAmCeLkb679I/HCX0UAWO01v5CPZiPFfJKXE3AJLogI/
	 yRrGqWpVCFBYmeIxNebNqWqDU2CAlECAGeuUOM1GwxnLSHADC0872q8/rR1WjR++vpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=FTIkw6Pk;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27771606A323
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 16:54:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27771606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=FTIkw6Pk
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e0d1da913so702689f8f.1
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 09:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1793292858; x=1793897658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rWfNIvd9KHSVhrKI7F5X/cP2Aw32Q6yFR8REkiH5EXY=;
        b=FTIkw6PkN/tJBLpPjCD5eLda/R7udutck5k9tmyoNRO0xtJ+Yqxw4qkWhUzLBXPBX/
         QN0yEuAJQug62Z9jCa28dse2m30LDvEidEOChn3cWnP7PKp93HheoBvreB5ahapQDtob
         GOCdwgJMo2VUyw6avEXB9Q004IVCxZx9RQtIAJLtYNfnUwykQVVxljfLTrkA7mRESez3
         pVFgxLItrTPRYF7I8w8yfv1J42GKqYT+pwoDgkeVAbIoguTbbQI7p9w7pwFRBMAp4HK3
         6VlTl1grNBnZbeAqqJnam1HGsrK6EUq/M/zbtE98wx26qjmRcZVcvmO2m1xWpSGQFhex
         h64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793292858; x=1793897658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rWfNIvd9KHSVhrKI7F5X/cP2Aw32Q6yFR8REkiH5EXY=;
        b=taVcEeEC9o7ZD45oVcKNdTfD2USIB04fwQmg4aj1XLerFsgDhxsPZjSrzt6eYCBW3S
         YsN+0S8VAyk20IpQ4iJ3m/pX70iogGdz5o/rOUrbvh11wNPW02iAs7D5pkFU7xZ8RM3T
         3ZWI9X9TafZHNY3ES9hAcoFmv0pzLxV52d7fQ+lAxtXaW8B4BclgLAVuiU94Mx7rrn3P
         lcbhjIqY+E1XDuM8fdMvGjF5j9Jc+oWlvZKoHzLa0ubfmSIZjSl+A9NoGYdEiIoGLzxd
         +q9Maeuis/uJqFbw6qcFVfxVG8PwBtEJMkWcUUf/QF6HQNNm3W3gK2dqIx/MDfKdy0ID
         duzA==
X-Gm-Message-State: AFq9FYLziF7Mb/SULgggyl1x1rXVpwesKZJ0IXd/lKbWZYVzoZChEa3c
	yPMyOPbCKJ8P8ZSSTgfTRGr73YHvH9vUXr5kPJppC6qbZRC86M79c17bdCU+5voecww=
X-Gm-Gg: AYBFou0r8ny5m7CjIIaYxgURIcv7V0EU4n0UXqprtc6w0Ju9BgJaAxHz2/E9homeOGw
	t7dDlOUo8BnpBBmOYPj0Abw9IjtxMqlYvu6ix3Eh27/3UK5F3XzYedf1YHLxp426uWqMSUadJlg
	wMLPjkJx5f7dFkN45wCP/Xt47/XLyTSYWNojOO8A8lWNHLlzI++4kuVCdKaWDDCfK1mw+EYh8md
	SMf5fG7HdUtZXPic80vyBPxlNC4GEYBCn6aZiIuGLAnEk1aD2mOkWjIRVEXCemRXvIKW+zX/xly
	2GyrjDYfjXRB6Y5HBEBylzDh3nB/W3uRMu5qcbZl31tRlw9+ZKSgM1EWC30beUXHlQQKNhKlCZM
	pWwNR7n3DmNML1Hf5adFDKr1Z24o1nkK2SAeFpAbsDnPbfG2LtyGN2P0fDAeAVfb30A6+r0TxXI
	3HssV0j24h7Dj5u26OKuzgP3m7ymNP0EfZrn/c7qDaAFVoYmc2vIUs1yn6IK8ARDH7sRPqS4y9X
	QaiVNlLRCcz0P1V8IlyjsrybDabRZPdmc9tRnmliyHAJ5vSKhIubcafNwCcvNMLUWQyA9Wu5ntN
	WU2GgWmH35Z9TmxCrR5aesVXorBlLU73cW4NkegKdqo=
X-Received: by 2002:a5d:69c9:0:b0:48e:55bd:9ce2 with SMTP id ffacd0b85a97d-48e64cc70d2mr5526326f8f.20.1793292858506;
        Thu, 29 Oct 2026 09:54:18 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:db5:c0cf:53f4:d20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6df87fdbsm310880f8f.13.2026.10.29.09.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:54:18 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 29 Oct 2026 16:54:13 +0000
Subject: [PATCH 1/5] media: cec: seco: Use named initializers for
 acpi_device_id
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
Message-Id: <20261029-acpi-media-v1-1-eb50f0a34e36@thegoodpenguin.co.uk>
References: <20261029-acpi-media-v1-0-eb50f0a34e36@thegoodpenguin.co.uk>
In-Reply-To: <20261029-acpi-media-v1-0-eb50f0a34e36@thegoodpenguin.co.uk>
To: Ettore Chimenti <ek5.chimenti@gmail.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Miguel Vadillo <miguel.vadillo@intel.com>, 
 Antti Laakso <antti.laakso@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Bingbu Cao <bingbu.cao@amd.com>, Bryan O'Donoghue <bod@kernel.org>, 
 Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, 
 Arec Kao <arec.kao@intel.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Kate Hsuan <hpa@redhat.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793292856; l=1075;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=G7LrNd+dF624ZiXyk14jYht6szTrrJKNGSWqp5QLf+U=;
 b=oc0ISUO/Ys+wXb++/90Cl1FqTqKn4Mgr63H2IC6cDhi+ghcSZwFbi4USMACYUSeNTnvayaC0S
 zBVVDIec7ogC12jzUBzS15DTuUhzoP3n7V/XuE1moxfBQsIKCTBEPW7
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/media/cec/platform/seco/seco-cec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/platform/seco/seco-cec.c b/drivers/media/cec/platform/seco/seco-cec.c
index 12db6dca602b..2d7ee5638eba 100644
--- a/drivers/media/cec/platform/seco/seco-cec.c
+++ b/drivers/media/cec/platform/seco/seco-cec.c
@@ -768,8 +768,8 @@ static SIMPLE_DEV_PM_OPS(secocec_pm_ops, secocec_suspend, secocec_resume);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id secocec_acpi_match[] = {
-	{"CEC00001", 0},
-	{},
+	{ .id = "CEC00001" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, secocec_acpi_match);

-- 
2.53.0

