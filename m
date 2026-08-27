Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787554C77BB
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 18:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854760; cv=none; b=QrkiuQxsf5mIW+/yM3I9D2yk+TYgQgeQ6c7v+b1GTrS7I+1zcCu9OzCwBzPWqo6x9pCwqGIHfYxOL+YEO09dAzBGEhuTVIApw+Obvk6IzcVEqj5pKj0MGsN7X660jONCBUvv4bfRTyJao6j2ZnEJXSRw1tILJN68ln9/XXG0Ee8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854760; c=relaxed/simple;
	bh=laeJaCvRd81udZfwhlzLQ/pBiNLkEyq18mqwuNA0OIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ewqN0lmiqoQJI+EDyUU0j/5+V6kpBT3zLUmIqMhOy7+8TlNSCbJoDk9x5m1E60l7M+sbq/8/w4i/BW7JGxB/vBx0vNBBRtrm5MK+mWh1Y0+xRvdyj7NyI6G1LAxHuEJYOPLkSfkJ0hETGPnzxTAlXmo1/KNJtlyNZx5VZKQNZx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vm1wiD4x; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vm1wiD4x"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4815bce4652so115342f8f.1
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 11:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854754; x=1788459554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eXazbZDjHYS7TxQMC+6npHdpPuAZoywDenkIT58mmgM=;
        b=Vm1wiD4xngdmdbJ7Q724KkCQ1P5WGn9HhNe3L4kwzcy3WbT/9exNwEYu4Rw3knE2VQ
         sXsHrSMMDPG7X53ZEo5pq2UcEBz2QMOnAmcF4DK8o2WwurY0qeAdLv/LGbFodfaOvZOv
         uPyoznno1BLNBLt1+g8U//pSNKClwAIMNJw/2VVUZMuIHPsIV+Z2b53bsRQWNUIIHj4N
         2ZxKjbNGuS8fuQcohQhVUnD9DIrc28ECG2ayBfIM71UUSkcU5OTZVWcKkUYSEHQ7yc3k
         eqypMr0QFNOzPwIJ6ukV4Td2HvMhLw+r2YVyDsEORuEl+4cHt2aQzpgF0ry83oLjhY6o
         BQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854754; x=1788459554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eXazbZDjHYS7TxQMC+6npHdpPuAZoywDenkIT58mmgM=;
        b=nBmMZ+D+x5foQCN2ORSkD8HyXnEePAPKzbtMU6kmWWExX6BCk9JGM5fVOfOmr6+eoE
         lx6/ljzoR+In+gMYaqwo98jbjz+LFX3YKlBpjrWxtDEZT3uPMkfOlQz3D5XpdmG3I/K9
         dq6imk11iiF+O6y/nTbPLCy7vQZTLlUQrm+Z+PUwY1jb2OsQKP8Qnjs2I06T8dlojeFH
         +CW9N4YbTBs6zSGAQw8hkC4MRasX4h5Gfk2V9leND0tYMVMHGpd5hFO05xg1qEXy9Afx
         ZjyfVSWMNg/XKGSCKXpsaniBD51HcN6SPF15M+b1JX3BrYMD6lTpSmVraLIblWsjCI36
         6geQ==
X-Forwarded-Encrypted: i=1; AHgh+RoR7wv3Vu1/2qDP+1QdWajWed59B58yboGAvAXtOEOaz+U/wmb2U9XgAzpvbXZnyTUQDkZQtKmGw1M/eQ==@vger.kernel.org
X-Gm-Message-State: AFuF++k5yL05auS2Z+yFBapu1uXbNEHuyc/mqdAtINrpxEDYhDNV4+wT
	vH3piGMe+IFM4m8Wo46uvWMs35BYH9wO9bZSQygt/xi432p9AVVwte+B
X-Gm-Gg: AR+sD11LJBBn2lup/iO9gWxcaxwvwPzXfOLlQSlgjeyPd6fzPGmNMoMKNlgNBhZqOGw
	gxbvNwzootnmAMKuTC+nPYT838/8aHJbou1Hx1ygMaxOVVeXzNYYz4xt2xROt9sGDb+EvyGoatU
	Mdn+PjLXkmEpF9Ycg3mxahwlz44ghBCXT7B3JTU8kKfKJXU6fK0bBZsd0aiQPxTkUffm9od43bt
	1p5nkDyrixdzYVhr5GW6txsB/TXsbzf6RgJFN9EQp3Np4fJyKkGNwrllx29L2fj37hn9U8rzNBb
	HxgZFSdSZH4YY1quIT2jAEYU0lrCFEvc21c4zMKo36BRlWBo/VMMaRnkNgH0v8PUuEr3sCzqUy+
	YcZxRc9ghc3WqYdm41PmpaYUKJCVU+gsURVQCvGawZnn4wntQ6dXScJUM7RRsjkFOUXl3jT9ng6
	zrMrGILOsZSUM7QVPR6q2Lp49W++Kyc9/MUeNo0FEEREIkEACZgWtAC6NC12IpHbLOc9M2FyCbw
	Etr1jiepqwi/Yv/RhC6FidsYb+c4g1eDWDxqaKkFv6y
X-Received: by 2002:a05:6000:2388:b0:47f:5369:bba with SMTP id ffacd0b85a97d-482f79d7637mr707984f8f.15.1787854753934;
        Thu, 27 Aug 2026 11:19:13 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279eef5sm10428350f8f.1.2026.08.27.11.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:19:13 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: Re: [PATCH 2/8] media: i2c: Add Yoga Book camera ACPI IDs
Date: Thu, 27 Aug 2026 20:19:10 +0200
Message-ID: <20260827181910.2431826-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <apAKR_wiAUhI0ZQn@ashevche-desk.local>
References: <apAKR_wiAUhI0ZQn@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here is the requested excerpt from the YB1-X91L DSDT. Both devices are under
\\_SB.PCI0.I2C3:

    Device (CA11)
    {
        Name (_HID, "INT3477")
        Name (_CID, "OVTI8858")
        Name (_DDN, "OV8858")
    }

    Device (CA01)
    {
        Name (_HID, "OVTI2740")
        Name (_CID, "OVTI2740")
        Name (_DDN, "OV2740")
    }

The corresponding runtime ACPI paths are \\_SB.PCI0.I2C3.CA11 and
\\_SB.PCI0.I2C3.CA01. In v2 the ID additions are split into one patch per
driver and preceded by the requested C99-initializer cleanup.

Maurizio
