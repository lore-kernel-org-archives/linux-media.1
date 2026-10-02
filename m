Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDA5320A37
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 09:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932674; cv=none; b=OQ5DSMrGnY4fhnMVvvJOANejedhEJLfXkKCetj1Si+JmXXZKX1RbBUGmXJx7LWyGL+esat1JE35jkGILf3PjEIFIZMEneqfPNwMyxIDD/L+K2ohGbSNFmhsA/B43lrcowMX2WM/HQRlB5osVRz1FUacmmV1Oucm54JUUJpSqcog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932674; c=relaxed/simple;
	bh=Vnwupgsqqua90+twkjySStW6ffZlrwSOpXf3UgPtv7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DARJG9+99W1cElLkME5ODsCxRDpO8Kww+5ZYc6QKm/V5sE0WXTNmwVz+1Z0XUTG5C7208az2v3QG2zhk1daoTk7jfSTBA4Hyn4Ta3aAeocJn60iBPfQF1YZip1ochICBLi/cmhTlEUrbrq4MwXFD3Wfn8QicAap1pDvYcQJw2XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8C61i+H; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8C61i+H"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so46659555e9.1
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 02:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932671; x=1791537471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BtDqhbbon9lgA9uJuFoMzkzdbPQZ/GXdO0KH7GsNg0Q=;
        b=S8C61i+HeicGPa/h+QI4UH3RP1+5+Ezo+/Ak6QbYD1IcVmpk23V5mUvTesGys8u57s
         2bEEZ+Ii62YqSl5C8e7046f6V73EXbcvscB7r6P0m+Nz62NZFhxGM4sat52VeVWg5x3C
         Ul6mR3kjJYLGD3IeORQvKf88vZD6slI+YiJFo62fsZ5ZGrfttdXlq5W7NM7PJL94k55x
         FEPh2IWGWcRQd++tqhZPpNK7trb6uvnI76tEgW0ZI2nBbsQovi6Qw2iyjX4AvFLojPID
         imxni31hcvBhPQ2mLtdEbObiWNpcN170KDl4QFByht9G+fFcWNGeFPFAGcwENNW8v2n1
         UFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932671; x=1791537471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BtDqhbbon9lgA9uJuFoMzkzdbPQZ/GXdO0KH7GsNg0Q=;
        b=y9Zg1wcBb3vX++iFnxvbLL/GlM/YPxk0hlLu+4DWt182mgytOOtccMdmwKR5+m82Gx
         9uypPQeLm9t746Moc5Wfb1YzqkiAUOZs2UD4JSYmeoIFBpkXSGwVCbk4O22psHu5tx3U
         VtcAeeyBYYq72rxrArSFIMdYOr7/7hS3ddaNHhQUFGIfi96n1cXU1YC92yHCvyjOAPAE
         nAQgCvmB/zPY7jibvjJRkTar4uHlpKurp9GMQilfew34X8YVHt3BeChjdTOyw42//NjZ
         RQ87XDE5LAkEMdO4sTtal4N70rEb3fI9ONmkFTeTfg2ExQ96lmCrfQDevX/Y62GXonef
         DfDg==
X-Forwarded-Encrypted: i=1; AKwUvBy0XLgld19a/kB4WyPDwGXoS4izuQgITaF2tHWO6EPDdS+JSZN4L0m/q0RumM+hSM17eAYnkrqozrMeyQ==@vger.kernel.org
X-Gm-Message-State: AFuF++m/XaRAdA8Swnf6yHFi2aijZeDL0atSKupbbp3IppgYDvVwycya
	+HAJAqliyn3LXf+HuR6fU7k6iN9hOvO0ttcC9BCbw2TWbnGfpAtGQDCP
X-Gm-Gg: AYBFou28cbKpmRqJ3qCTSPl2rIDDaTFL+bfUVuOT89mcUd6UN1ovHHh9m57v9AsP5bc
	biUTUCbBARVC5eX+KwK8q0gbg/ug32bw6vLyAvHI48YnqdkCegc64qH61UPMrUdaU6FB4fdqGd/
	iXmwh5TMHyNIqnSw/vsB0njNjV1vnxcrqzuvC4ONHq603vi6H3WWUQG4LfdxUEGWdMOFBRSyQCm
	X6THWrDpAhx1kPG8RBXYj+uEnF0MMxOf7fbvkzV3Y5rtqgSy8npC/HkFS5EPYSv9V3wLV2r0o58
	svHqAelWZTCBoGMDve74I+KsQXwRJEE2NGc1f1ICVXqFSNYqvNnuPvsF+mmLLUgDoiO76kqN8cG
	TwR5vF9I0D4XL5VCOsxquuj/zf8CPGHXmjB1xGc67nwH9uhYit84eT283wokaT+q+xg43G2coZL
	QFBapTPerLYcl54MF8D/CjotPshGiSlaTNPMYJN5VaF74UyS6yOQ6cOTM3PTS5Qt0oJ3TJvgMnM
	0Y9RBvaBylJu4Pb90L7NN56iWb3D8NcfGXjqude1FozyS3eT4YDJMf3JZk=
X-Received: by 2002:a05:600c:4e56:b0:49f:e941:d6e with SMTP id 5b1f17b1804b1-4a027584b22mr41936255e9.21.1790932671197;
        Fri, 02 Oct 2026 02:17:51 -0700 (PDT)
Received: from 1Z10 ([2a02:b123:8010:a99a:44ac:6cdb:a419:601e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03feed16bsm45498425e9.4.2026.10.02.02.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:17:50 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 02/16] media: ov8858: support 19.2 MHz clock and CHT gain setup
Date: Fri,  2 Oct 2026 11:17:48 +0200
Message-ID: <20261002-media-v7-p02-sakari-reply-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ar674__4-cNOGMMy@kekkonen.localdomain>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com> <628adb1cabec866554ca26a2da5af860b04d6cb1.1788360629.git.mauriziocasciano7@gmail.com> <ar674__4-cNOGMMy@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I addressed these points in v10 patch 2.

The commit message now describes the implementation only; the runtime test
results are in the cover letter. I removed the invalid Link trailer. The
clock constants now consistently use integer unit macros:

  360 * HZ_PER_MHZ
  24000 * HZ_PER_KHZ
  19200 * HZ_PER_KHZ

I also removed the Cherry Trail/MRD naming from the sensor driver. The
19.2 MHz table is now named for its clock, link frequency, revision and lane
count: ov8858_19_2mhz_360mhz_r2a_4lane.

For white balance, the V4L2 UAPI defines RED_BALANCE and BLUE_BALANCE but no
standard GREEN_BALANCE control. The driver therefore keeps green at unity
and exposes red and blue relative to it, rather than adding a private UAPI
control without standard semantics.

With Best Regards,
Maurizio Casciano
