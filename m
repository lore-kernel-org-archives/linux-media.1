Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E38CBA3D
	for <linux-media@vger.kernel.org>; Sat, 29 Aug 2026 13:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788008530; cv=none; b=mOJL0OPjSDp/X5EUnz06utlQ3EJq8OqykBr0AFtqUyHyRpTDmgq0roapZXeYgSDzwpoy+sJSo/G6ZQPNwAFuXKwsvFPGNvXofaz/J5r4TsDZftH6hT9Sru8qq7Cn8iPWmXlwryebtOzt5iBpO8z0KDIiXKeFYPHvLgPaCDTmS+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788008530; c=relaxed/simple;
	bh=nyKM/IQ76KD+bu3+wq+9rNnOCjc11EqAWBnfm2tDt/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AzCixadEyXlM21elT3z+q3gt43COszm3hvDYrdnXkjngYiwfZKEl/H1Ss+PR+lfNQq55bWDKAqfv7rKpNME4h2dUTK+cxC/ASDg4fSIIGs0B50KpgXufUpAFe00jiKk/vMf/ydEl2X60AogzerCwNO+584bQiyUci9WhGOdzP9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULvMJAZF; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULvMJAZF"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-484362f5c4aso1781f8f.3
        for <linux-media@vger.kernel.org>; Sat, 29 Aug 2026 06:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788008527; x=1788613327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HsKRSFXT+j/ZD+JNjkf8Ro9fgyDxKErAM9cXfCTVDKk=;
        b=ULvMJAZFqFi/I/rCGdd9GY6X+cRryrpiUkcSpp5N//LAHCR28hGSB+T1pAJSA0ZlF6
         Tkq8ZPQjMt9o/l0Y9TJBe1VngmfPdm6WV37z2QL+UhDSWspMK0dcpzAsG22rP69bs4u/
         BVWOv+0nSGEgq9SAPxNpdBpO9kL/rZNQn/asU/zNGDKbMqeOQBLCDUx/9DmCLurtRJsq
         QSGZ0xYDz22c4OXiXJnmF+JyfshMWKht/Aq4/4FPhOlUUKl33YpD9ID9zP0Mz/w7QWS/
         hSQ6+7shdBcKyinVbdaUjzv6VPNpT5jAUMy2Tl9VQEFenCoIbXVtnv3MP6SeIt0DpW3X
         RPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788008527; x=1788613327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HsKRSFXT+j/ZD+JNjkf8Ro9fgyDxKErAM9cXfCTVDKk=;
        b=cDww50jgjk5vuWeDTaBuqnrs0YKDlWgapHDX4DU+ncvA/tVhaBei0dJ4+ia98vWemN
         SCnC3VzU74+ASwSACFf51081kdkaW/H513zlDEnA4unVHKPZ43N4DKt06/A7f/CZABvS
         kpzFaB7EFYbABFW8VkKcENXNGEXsWB+18MqhZKogZtFUBiut4BluPLedIQk1/BFE4UQw
         YoU657VlE43WqKe/zwnKnOzBqb0z3m7bR3pxHvQyLRt7Ey2Xx/SXnIAtNy627GweIOJ1
         8vjs9U/98F016nKNc4uPa9ACL1whWK3HZa+Vq7Y65kdh09oSqddXxp733QKaB1Z8L9vc
         qyZQ==
X-Gm-Message-State: AFuF++n3ydbS1v07TbT+/seVLxBf2WfLZaenUv9zvgKBytvMIYsYUTxf
	dbkr+NwJAzvygcQa7T4KZpoa/7sXh2AiT5DYXTKCZkM/VHccrJ1I6+BfS8+dnPNn0As=
X-Gm-Gg: AYBFou1VO8ie/5yndp7qbHKZdvPxhgAdMSuQgZmRZg8jTYtZFg8eKIPM111jkeMPa9u
	ZPGE8gNPT+XWAr1ATrPrtg7LR/Ya/xr5Q76PGEQuys1lyRe5jxXlX49rcswrmNf88scPnhC+Y3V
	4+LFIYLsDaNHNXlqaRX2kv9jliyq8bnFAtRjtIld8Zn97pGIhsm7C55sBOw1mpNktv4qS1kchaP
	3tCBl7mECa91kq7pqyc8zcOD9mhEFYGlvjXMuThLa+swaL4MVeHO+2U/Un/3JJm/9V4idWe1PIX
	PjiKk1rajIFvEWsaexfsNxNXhs9D1te6HTaz+nzKJEDhK77d9aLdAoJeae2YnlAu9fraPkZJ5We
	8VMvwJI2sy9C7CZqgrA4SSfd891A3TAWz7DRQN2eYuXb1BeyRN0TqXlXH5d0CczNbJMMpjmPp2q
	RblzXfSCFt2dlpXA743ljXl2kUzgO9uD4q10GbjQUAdlutJmi3xOcCBBTNkPssbA7PWcOBjidau
	kHJzIhunLYUMFDQ99i2vWKauTR9DZUj9w6FBZC19MmoqlaNO2qpr2q0sBYsIcAI0L/i8Zt2l2W+
	voAAxAptBujc2aE=
X-Received: by 2002:a05:6000:18a6:b0:482:d900:6558 with SMTP id ffacd0b85a97d-482f7984d0dmr18161892f8f.7.1788008526497;
        Sat, 29 Aug 2026 06:02:06 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb27941sm9582740f8f.27.2026.08.29.06.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 06:01:59 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	media-ci@linuxtv.org
Subject: Re: [PATCH v3 2/3] media: i2c: Add driver for OmniVision OV32C4
Date: Sat, 29 Aug 2026 15:01:57 +0200
Message-ID: <20260829130157.5859-1-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260829121613.686D41F000E9@smtp.kernel.org>
References: <20260829115832.8749-1-robertbozik@gmail.com> <20260829115832.8749-3-robertbozik@gmail.com> <20260829121613.686D41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Aug 29, 2026, sashiko-bot@kernel.org wrote:

Hi,

Thank you for the review. All three findings are real. The first one
needs a different fix from the one the description implies, and I would
rather say why than fix it quietly.

> [High] Incorrect error handling of pm_runtime_get_if_active() leads to
> PM usage counter underflow.

Confirmed, but only for one of the two cases the negative return covers.

pm_runtime_get_if_active() returns -EINVAL when runtime PM is disabled
for the device and does not take a reference in that case, so the
unconditional pm_runtime_put() at the end of the function does underflow
the counter. That part is right.

Returning the error early would break the other case, though. With
CONFIG_PM=n the inline version in include/linux/pm_runtime.h returns
-EINVAL unconditionally, so an early return would make every control
write fail on a kernel without runtime PM - where the sensor is in fact
permanently powered and the writes are exactly what should happen. The
drivers in the tree that use this idiom (gc05a2, gc08a3, imx283 and
lm3560, twice) all let the negative value fall through for that reason.

v4 therefore keeps the fall-through and only drops a reference that was
actually taken:

	/*
	 * A negative return means runtime PM is disabled for the device,
	 * in which case it is powered and the registers can be written,
	 * but no reference was taken and none may be dropped below.
	 */
	pm = pm_runtime_get_if_active(ov32c4->dev);
	if (!pm)
		return 0;
	...
	if (pm > 0)
		pm_runtime_put(ov32c4->dev);

> [Medium] Missing colorspace and format field initializations in
> ov32c4_update_pad_format().

Right, thank you. The fields are left as userspace passed them and then
stored in the subdev state. gc05a2 and gc08a3 set all four, and v4 does
the same:

	fmt->colorspace = V4L2_COLORSPACE_RAW;
	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
	fmt->xfer_func = V4L2_XFER_FUNC_NONE;

> [Low] Missing stubs for ACPI resource functions when CONFIG_ACPI is
> disabled causes build errors.

Right, and it is a consequence of a change made in v3.
acpi_dev_get_resources() and acpi_dev_free_resource_list() are declared
inside the CONFIG_ACPI section of include/linux/acpi.h and have no stubs
in the #else branch, so with "depends on ACPI || COMPILE_TEST" dropped
from Kconfig in v3 the driver no longer builds without ACPI. v4 puts the
_CRS walk behind #ifdef CONFIG_ACPI with a stub returning 0, which is
also more honest: that lookup only means anything on an ACPI platform.

All three are fixed in my tree and will be in v4, which is waiting for
the rest of the review of v3. Rebuilt and re-tested on the machine after
the changes: the sensor probes, streams and the controls still work.

Thanks,
Robert
