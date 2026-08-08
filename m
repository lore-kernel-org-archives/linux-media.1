Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F47376469
	for <linux-media@vger.kernel.org>; Sat,  8 Aug 2026 09:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786179950; cv=none; b=taTe3ec1TL3mNNFrpw/DfYzmIGQlHP57NsjEMgHTzKP4EcUGIY+KMtjoW8iqfTi24jgSkhtiBztcHr1946RNv/uCuQvX1YrZsIPrC0elMzD13YXQnwhd+SVvlz7VbvjVAVxQH2xXhv+Xfi7U1anmOuKuhqqu4Lu0X2XLsXLuEXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786179950; c=relaxed/simple;
	bh=enrueu65bzkjyvg3HC9FgxN5+DBuHk4uNV/PtqniTDw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uU4BdUaCTVBkezCmJL1ztrr02Dfg4jOOKf9KBB1D4FtUX9WxHsQ7q2zBRJl/igZlfB9yEyIB9t7vEBMuv6PHc/0aECBx2eOGQmqc84gcMW4bwgMYZQkjdaO5W3Djz2t/VianAJtzwYn75iGT8uTQ6Cwtl8V+vRrYbiLMEXa5jRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bK1XQcTd; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bK1XQcTd"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2caed617615so4102345ad.3
        for <linux-media@vger.kernel.org>; Sat, 08 Aug 2026 02:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786179948; x=1786784748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2wqvcWoakAHAOfbnCvk5W2K5QMWwrKblDk8o5LDji4A=;
        b=bK1XQcTdKxZZt66l2ahwozekxGma5ej2dtceP+j2Gtb3gBW16nlZUUYVUjF3gAksww
         HLJ2aHDdx9ipMhiipsVCs2TwksiyvVVEfG9S1iSARtJ0QZz69VkmqErscuAkS0L9+zsV
         EydRwMY38VSFRnvhNSJEHcKYuxJjpKL7OLzzrtuiuzqH18BWA6YCazd9OlsIwcH11KuD
         7P7Zp9Hm3jgzXVae6GasJ48xo701k155pNZwi1eSWxX5ZuyQ0fL7thunWkprBnfAmoJF
         m35mWvcb1nLXtQrd8dPZ6kCT2vt+3ypXlEXfjNPI6yhLJwkrKKjFPlBOH/8mJ08JfMWI
         vzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786179948; x=1786784748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2wqvcWoakAHAOfbnCvk5W2K5QMWwrKblDk8o5LDji4A=;
        b=Tk9IVRded0u4HXlOZ4jo6tqdmHXPX1z+xUJV8HAxSZRmAOUTiYCBk8LTCZgu4aodyV
         H79NHwfkusbmjFD+1UoVyLWTKkzp254HB/zCU1MVBkqWqrsltEUbfEZfNrofT4KEXaai
         2a6dQVBf935bH2KFXsch8mMCpKcJ+A/nQboLU1RJhYzhAHJPhbdVxzlZPu5w9ZMTTq9T
         zn0/Rs2nAGqACp+KukPeCx6VT8J5EZS9G2LjPLtd4UI2vqjGi0GhWfK7VHETnT6J39/n
         kJME876sEOwqssnczJ5dQb3OOzy7an9U6cvQJw+rMXjn8yoar/Pmfk8dfstLJO+djjqp
         Ujgw==
X-Forwarded-Encrypted: i=1; AHgh+Ror9VKnyQVRxWC9PwNmEvxdfW/EyT+xNZO5BYuqPhOgQ7JaYXG2cpmOWeFQ/wMOYNjBHYRoeU8KxqACUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5OWnmWcGHeaJxQpQA53q0RXiBsk5NZcjhtf+wbCaMtkcEqpwg
	wgjrE7XPTILvrGAzqXN7fQA6DpwF6/ghjPkpVP45Tz2uNEY0+o+AMhka
X-Gm-Gg: AR+sD12ZA4u037BfEBn8poe1YBuEdANncdSWFR9YIcAra665L61ibBOVPBhc73MVbxt
	5doWn7ssWr9aJN+hmwnY6j6hmsJ5SbMVxTey8fBH9gSdmW/Ouy2mjNAT6fHwvMTnEfccAoPEbx4
	HEg50kKkdaIv+C2D0sMt200IguwrEhpYnY1Ar9WCR3WfnGvi827I9nT+9AQ0PeA/VtgQXhiqnv2
	0bQdfWWu2c0dmJrJGRLAW+l8zKXQLExi+O7GDdwtbMq6VjjaqEORF40X8Zr0dX67KbDzSeXDAde
	ZeTXYPbz1w2wHdlE4OzPR4pUtkNXUJJUx9/GjBl6Hy1dpSaCSFdieYjk4OyZ5iLbt9mplpCBhOb
	wMtDMqXXio13umfDxuY+EzQOUCUsP9Sq2EB7Unq42ff5c3Pl8ni1sv2utl/6Ny7eYtouFLmPe8j
	PuZCAEHotVVEmn9WKsI9PYtmcMF0ZqAGfhTALmtjdLI4VbTKt0WKCcUk40EwtWe8muD3YNycXPn
	mpNTQ==
X-Received: by 2002:a05:6a20:43a9:b0:3c3:8651:b302 with SMTP id adf61e73a8af0-3cb85f60443mr34767349637.28.1786179948335;
        Sat, 08 Aug 2026 02:05:48 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86d3fcsm17054754eec.4.2026.08.08.02.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 02:05:47 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: stm32-dcmi: fix async notifier leak on probe error path
Date: Sat,  8 Aug 2026 16:05:41 +0700
Message-Id: <20260808090541.2674255-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dcmi_graph_init() registers the V4L2 async notifier with
v4l2_async_nf_register(). The probe error label err_cleanup is reached
after dcmi_graph_init() has already succeeded (e.g. when the subsequent
reset_control_assert()/deassert() fails), but it calls only
v4l2_async_nf_cleanup() and never v4l2_async_nf_unregister().

The notifier therefore remains chained in the global notifier_list while
the enclosing struct stm32_dcmi is freed, leading to list corruption and
a use-after-free when the list is next walked.

Unregister the notifier before cleaning it up on the error path, matching
the teardown already done in dcmi_remove().

Fixes: d079f94c9046 ("media: platform: Switch to v4l2_async_notifier_add_subdev")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index e5663fbe6422..eeb0199864dd 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -2195,6 +2195,7 @@ static int dcmi_probe(struct platform_device *pdev)
 	return 0;
 
 err_cleanup:
+	v4l2_async_nf_unregister(&dcmi->notifier);
 	v4l2_async_nf_cleanup(&dcmi->notifier);
 err_media_entity_cleanup:
 	media_entity_cleanup(&dcmi->vdev->entity);
-- 
2.25.1

