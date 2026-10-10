Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D1F376466
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 04:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791608369; cv=none; b=FsTUZXULlNcEy/j7NtoZX/a9mTn1pQYgIDNWF6d1P8I/t1jfZB6kAjnMqVzb+I64H2hbJ4v3uPk77LLwkvJYiKWl51iJ/aBDxjpvts4V1fW9IHKCTRWNZUhGJpgTqs75wn6jXc0OWdScrzIOJRZ8NdEj+xqHPd3QoIrZzY1gJZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791608369; c=relaxed/simple;
	bh=P7yCH5kYXrmTKOJ0FGZzZuy+blQgstUKAmh/g+oX51s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EFt5Thjxg/+9t91n0GlqZUw/H/KWNkHoOpU5/fuLIaTFhbSOu2KUIVH7hIcSye5Czo/6pz3DMoEaIfKwi3ES3+T/lbxxmTBbVG8ctnTxiJngaQ7+TZ+qlthpXeUejegaCHVuwfoA76OTnK9udImcc7BW3qyDv3mCY98QkQsafl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca; spf=pass smtp.mailfrom=metarealtyinc.ca; dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b=ncNbsusu; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="ncNbsusu"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93e706a6ba9so43602585a.2
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2026 21:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1791608365; x=1792213165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8nRDOlvFA2YLyiFZW2o7vc4YCb0RwgsJ9ji12ZBwLmc=;
        b=ncNbsusu7y+0/8uWqVIiOntLT/54Az/z+wnfEmqhHHpJyAZ3/WQzXQ6wcBAnqOU5C8
         mjxK7KJuCrBPKYj++Un1y+/uO2v9VfByLOwPPEJorxl+w4njSQG/OA1xKKHqYOoDlX+b
         OGro8H+/vrYLmahe7fJ/I1BuaeqGWLLUWg+P+b5yGTYtMQmejNSO0nyZwHYrQN5I9CUQ
         +e3e5otVB50XgEa5QmwV1j/+VuiWRb5djsV5LYl6BG0kBoWmDd0qpUZ5FMucXkAZqRZM
         +A0ckSzeNkuSHRhB+UQttiOvFBJRG4pNzp/qK4rep9nHkYJXUMsL9l/Szvfl5EK6gE1K
         q19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791608365; x=1792213165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8nRDOlvFA2YLyiFZW2o7vc4YCb0RwgsJ9ji12ZBwLmc=;
        b=g/Mgp8CLj7DWCQp9Z1uFRFg0rq+WTRBr6btIfsdiQOrDxiaIruKKWG0Agdh9k0z18N
         PfFiKUNfihlcMU0vr6KxpkQeD5zv4BcXtcL4kXQ8z4CKlMkYuzGGaBGdhR25x7NBIAuH
         DsdH7vcSuZ/3I/ZgmbWJdoHmh1IBLxLYOg9F5exXir5zWbT8hEtpKDTYGyy+tzLjtYa4
         F6CgPI/M0bNCnWmfN+Qd8oTnnyi+V4ty/F4WrXbdCWU70zjd25bLUt5HVJCRfcx47S8K
         dmn/37lokTyqwVScm0HwqJBE81JBYilVMomTCg7gY06LR7ZBdXjR9UErNhY3KsvIfpjg
         it4g==
X-Forwarded-Encrypted: i=1; AKwUvByPhEf7wWgc3We9VVae8FobcX3mUeOgKsn5NuGw23y7gqb1Fzb3xgn1Q9OP3MREOcMxN4j/cxR4+Rc46w==@vger.kernel.org
X-Gm-Message-State: AFq9FYKAaF5oT6uy87hhq+u3tAeXaoJA9hg0Yvy+H5W/dan672ubAf9W
	GUUq9sV55KH5OtNafKwlghNCCV9nVkCuqoBZXoLocYyFtlNA+MBeQN6gdD51Dw17NPI=
X-Gm-Gg: AYBFou3qD1s+EL/jipEEEg+1f+GeaEnKXIk+MLZHaJgSYSpcemsFcc10kX3V9XfMzEr
	ZU0W3CxKyVkd9JbTuzlZB+vl+3DWO1h4uBMV8CeEpgQyEaHwtj5Aubxd69UxtUVePEV/ElTQ/X2
	nKZ/lcaYJJJ9d6k3iwHefgxUQ/eTGAi1zacYoLYjnmBa/XYfcjHW6aoDnLED87ORXAW64xVU2Fd
	XmpxU2RHdkdcQpi4n3EAjxjF3xT4jkIDMdK6t5BCkOiMIrPvqDFvM6gKAENMeVRYP12QcVd+661
	m9Vtuy6CwjlkOAzwLuVhat3bAEon5kMWjzgQCXYNXwgdiLNBXs1E55btNE3OyHNIHZjtVge0FVF
	oOweXijsaRlTnXmM1wEy8ChMEBv3ADFGvqhe4mlJiB5079rIqGfGGNHNVj9CUoGcc2n49sdZlFN
	6Bjb3h/2Rrm/5AmIxDPblENxBL81IpfRNpFk2vpPZFOUAhMxC4rljAmU5mQib9PBoVEQV7X9IqU
	p19+fdbdVBiRnjkEZa+VpEu4b+nADTf1v8EhCUS3o7m7tzIjXdYz/SrC2w8Xy3eTFMxEa4aCdmt
	OWCZNFPwqZowFJK3ncjxj8QSmpZnV7YufkyU9egA/e5JZ/QfTQ/+KE6M0iXHYry6+ISA
X-Received: by 2002:a05:620a:261d:b0:93e:49eb:a274 with SMTP id af79cd13be357-93ebd225724mr641879885a.23.1791608365448;
        Fri, 09 Oct 2026 21:59:25 -0700 (PDT)
Received: from jake-laptop ([153.67.39.44])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b550887ebsm35827736d6.33.2026.10.09.21.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 21:59:24 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: Ramshouriesh R <rshouriesh@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] media: hm1092: Intel IPU (ACPI) support on top of v6
Date: Sat, 10 Oct 2026 00:59:20 -0400
Message-ID: <cover.1791608336.git.j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260801-hm1092-driver-v6-0-5979f223748a@gmail.com>
References: <20260801-hm1092-driver-v6-0-5979f223748a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ramshouriesh, Sakari,

These two patches make the HM1092 usable on Intel IPU laptops, where the
sensor is described in ACPI as HIMX1092. They apply on top of
"[PATCH v6 0/2] media: Add Himax HM1092 mono NIR sensor driver".

Patch 1 is for the sensor driver. v6 cannot bind on x86: there is no
ACPI match table, the 19.2 MHz clock these machines supply is rejected,
and the only mode is the 24 MHz one. The patch selects the configuration
from the clock rate and adds the 19.2 MHz / 648x368 / 180.48 MHz one.
The 24 MHz path is functionally unchanged. Ramshouriesh, feel free to
fold it into a v7 if you prefer that to a follow-up.

Patch 2 is independent of the sensor. The IPU7 capture nodes have no
pixel format for MEDIA_BUS_FMT_Y10_1X10, so no monochrome sensor can be
captured, whatever its driver.

Tested together on a Dell XPS 16 DA16260 (Panther Lake), kernel
7.3-rc5, with the ipu-bridge entry that is already in media/next:

  intel_ipu7_isys.isys intel_ipu7.isys.40: bind hm1092 17-0024 nlanes is 1 port is 2

  link_frequency  180480000
  pixel_rate      36096000
  exposure        min=2 max=719 default=360

  Y10   648x368, 1344 bytes per line, 10 frames, 4945920 bytes
  Y10P  648x368,  832 bytes per line, 10 frames, 3061760 bytes

  exposure 100: mean level  59
  exposure 700: mean level 198

Two things worth knowing when reviewing patch 1:

- The 19.2 MHz configuration reads X 0..1293 and Y 0..733, which is the
  full 1296x736 array including the dummy border. That is what the
  vendor sequence programs, so the crop rectangle reports it as is, and
  it lies outside the 1280x720 crop bounds v6 defines. I left the
  bounds alone. Say if you would rather have them widened.

- The 24 MHz configuration is compile-tested only here. I have no
  devicetree hardware with this sensor.

Regards,
Jake

Jake Steinman (2):
  media: i2c: hm1092: Add ACPI enumeration and the 19.2 MHz
    configuration
  media: staging/ipu7: Add 10-bit greyscale capture formats

 drivers/media/i2c/hm1092.c                   | 363 ++++++++++++++++---
 drivers/staging/media/ipu7/ipu7-isys-video.c |   4 +
 2 files changed, 321 insertions(+), 46 deletions(-)

-- 
2.56.0

