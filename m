Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7CD431A4A
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 09:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791623730; cv=none; b=pcVdskedXndTA27+fMR8d59Yq1NfQDuTF68pfqtFNMSvXsSkcuGM/Mtz6AOfT83mCV6qCtiTD2Df5GjvNprYs9YQRP1QSOlZQNZKN+w+LEmKznXCOOlP7ZowO0MXa1qSU+0d0F4gKnfjl7bR1dEbAyyeaCRMYfZfOwPRqJgEiDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791623730; c=relaxed/simple;
	bh=pMBstT9/Xhd7MIwl1B19jAdAsHKIbsnScIIiwKmVBc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=egY4ye4VYUtg9NJ64yWezBjrCEZki99MTUh6T9VGDt1/j3q+mUNZMrzCIkoC6u7DMnifAmuLvuU0bOUagw6lg8qbUbvuhBv4sIm5HRBwnxo37UjZoesrKuhZDLdLFI5AiLr57HviOEePgAtL+xhpzqYAUFK9yf1wn6B/1Fxa9kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gTD3CkkT; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gTD3CkkT"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a02718da81so3712705e9.1
        for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 02:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791623727; x=1792228527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ORCsaPkxBXAIwv8e2nVnJgx67e0gWCZdbaFEBMdQuEI=;
        b=gTD3CkkTXhmUCku4Aet0xs78MwE85y4wAtcB2ASSVV3f4Qy3hbtcZrt1tyCgCqVHjn
         MgZzzyRiC2IGNb4ltSH3qvpo19RAIgmKL/y9UXFHVX1yM3lHbFfg5E1juiqKrc7XsoLX
         sT2YUanD4ghCa4ZsCe17bn6Dd+6d8XsfDemhCFYjCkEoIo/G0z7p/WHAkVcTkYeIxuts
         7BVkdmI7AaE5ReK5+r1NLhsZQvMRYZd5cR01YSeNhJ+9dZf8cZL92Rw7EA7w8BOr9Jyj
         NxtAI06DUM3rDzBdXwcEn9S6z+vQS7155CVRBjWcPw4m32PbeFncObMIOHix+xW3hEPQ
         vUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791623727; x=1792228527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ORCsaPkxBXAIwv8e2nVnJgx67e0gWCZdbaFEBMdQuEI=;
        b=RqyMl3bymzzjN7FRGYfY1CP3LZva6QB0QHFu8bLgWOJIQdREZlUq5z5WrBQmrs9rmy
         LH3wPV+3/cJ4aAxD2x2AfdMOHNKagZPBKC5TDD6ih8FupZFZoLMAjUXenHC4J3wrdQuG
         4vZv//lpqDVaXFGfEeBjuxT2iudlKoHzEiMyxc0jPuE+WQ2XuYUXqpndSN9Wq6nfIviV
         2rDB3faD9z+CpZ9TbTyGIrJcMvt42Q6+EwdBcIoT/dAlM3zp/2ldKE1Z98vy7SPgg0LC
         Wah9alfSx9komuwUn2I+Izzyu1jgDYsXd+/jiv7ScfpSJfL2YLi7BIZ2PZemNl3YumEl
         0ktQ==
X-Forwarded-Encrypted: i=1; AKwUvBwlQuggn+IA8bvR4+MF0Hb5GgP6YyactxfLIBUeSWmgR617llo57lKbRp/ux+cgavYUZVLpljefiCN9hA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLeEd8xSqa6RbspmJKmdH3RqtV8sAIIHQZw5kSbWM0A+ztCvznd
	NxQMteXoEuGbWnur4nRmcpFDKRm3PZ2Sjb7C0+vn0plOO9RAH/4TmeoT
X-Gm-Gg: AYBFou2Qv/bh+kkiOEjZn3ZAyn9MWB/jegCGPE9pdFTZ5wiY703yn/ZRj8KoBf8i4j5
	6cdTqXy7b1YUwX+kHrU7RM+zMRNBNnfNZr3M4nIHUdvuiUucv9rzg8eGGgzxulpaouVhKXhilHz
	Hay8C+C5O9eUskeS9NHRoiCusaZO+Y7jXlH6ZuaycSietDxoj9jCMoRZdi3ZKacShdXQS/JcC/P
	x2sQs6oj5JcDjwpMKrKJ6IZcZRsN4+TL+xUzNVcKE4SbxCT1FZYK/IDAmFgFYtYLiINM67yPcbv
	x1S1G4jCtXxqmQj/FmL7g6e1dswVYaJ/Y14+AxeZvVeLJEtV/aXx8Saen1inUxEWInw2PZLUkbd
	7sqx3FZbvIHXiVFo/u6MDW6fN56AiapKJt+BrWIMR9EKvlfEM+0ZeDzHUoSoMUkyTv0+Z6e8JYu
	XV1NzBOFIEb3cNd8Tk29DQN+GOO8mCdzZSyS9Eu2aHvgusOzafshkdFV1gTDJ9Ugzs2IN+x7qtH
	qduw73fsRM/L5izXPpWNmk9NPM=
X-Received: by 2002:a05:600c:4747:b0:4a1:80d8:aed0 with SMTP id 5b1f17b1804b1-4a18e4a9862mr85422695e9.15.1791623726602;
        Sat, 10 Oct 2026 02:15:26 -0700 (PDT)
Received: from ekulyk (78-80-42-240.customers.tmcz.cz. [78.80.42.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c198134sm118773235e9.15.2026.10.10.02.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 02:15:26 -0700 (PDT)
From: Eduard Kulyk <kulikeduard89@gmail.com>
To: j@metarealtyinc.ca
Cc: Ramshouriesh R <rshouriesh@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: i2c: hm1092: Add ACPI enumeration and the 19.2 MHz configuration
Date: Sat, 10 Oct 2026 11:15:24 +0200
Message-ID: <20261010091524.1390879-1-kulikeduard89@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <b0d32a3b82eca233652f878b7ca91e4dc2d8e863.1791608336.git.j@metarealtyinc.ca>
References: <cover.1791608336.git.j@metarealtyinc.ca> <b0d32a3b82eca233652f878b7ca91e4dc2d8e863.1791608336.git.j@metarealtyinc.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jake,

Tested v6 plus this patch on a Dell Latitude 7350 (Meteor Lake, IPU6),
kernel 7.2.3, with an out-of-tree ipu-bridge that has the HIMX1092
entry. Patch 2 is not needed there, IPU6 already has Y10.

The sensor binds as hm1092 i2c-HIMX1092:00 and streams Y10 648x368
(1344 bytes per line) through IPU6 CSI2 4 at link frequency 180480000.

- v4l2-compliance 1.32.0 on the subdev: 46 tests, 0 failures,
  0 warnings
- 300 frames at 30.11 fps, 20 start/stop cycles without errors
- runtime PM: suspended when idle, active while streaming
- streams again after s2idle suspend/resume
- exposure and analogue gain behave as expected (analogue gain
  0/32/64/128/255 gives mean levels 16/31/45/73/113)
- IR flood LED (INT3472) off/on/off at exposure 700: mean levels
  9/117/9, clean IR image with the LED on
- the crop rectangle reads (0,0)/1294x734 against bounds
  (8,8)/1280x720, as you described

One issue, which I think comes from v6 rather than this patch:
digital_gain is advertised as 256..4095, but only the low 10 bits
seem to take effect. At exposure 100:

  256  -> 15     1024 -> 8 (black frame)
  512  -> 22     1280 -> 15
  768  -> 29     2048 -> 8 (black frame)
  1023 -> 36     4095 -> 35

So 1024 behaves like 0 and 1280 like 256. Perhaps the maximum should
be 0x3ff, but I don't have the datasheet to confirm.

Thanks a lot for your work on this. If you need anything else tested on
this machine, feel free to contact me.

Tested-by: Eduard Kulyk <kulikeduard89@gmail.com> # Dell Latitude 7350 (IPU6)

Regards,
Eduard
