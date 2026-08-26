Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7B33E49F2
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 11:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742863; cv=none; b=VQyeeoCeaioyJ0AR21JCRH0BugahMPI8uA8i87S/6BUq4K8zj3vnzTn5USSpmf8twkP/jsCU22sFZ1/C/kr3uDGcud+7JAsrzIRAD2uXf7zbjBuMwMzJHCNHRObssLvzZllui+kc5Wbj8NIA2FNj7Vde551HDsKHmt4IQ8nMxsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742863; c=relaxed/simple;
	bh=yEwWLv05DrF9MgTuePjvN8u+YF5aUxxpn+QHoLZw6aU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WZWqYXvmw1HOvsQD0LufVkVvjv2vsBYVERnbgvBnciyd4wGxYPgTYUtardjZQ6o0lmLlWZzBf3v785PfSeKZgSS/Kyzxng7YhKd5qVfF283YKeLk+pPHYF3t2bn43H8ojc/MzeWPqa6SyUwuyvq2CcdQjC/MfoG0Z4EqvSYkFfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VMeWOvAL; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMeWOvAL"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso961692a12.3
        for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 04:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787742851; x=1788347651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=idBsAYohvhobxaclJcasJ4HiPtq7OOPdHTu6I6ld/zw=;
        b=VMeWOvALCLNHa5T3FZ4bbtdegQwP7+++kPLC+8T9OtanVlWdOZ04bHNtFRaskSevg0
         S5Xyg+NVDCYzTvcutg6x/j8YmD+G15IEHxEDkfrn2cWAz0qooRW/T+I4EhkkcAW5kE8a
         GbSsXWM7geX6Wuilc0QUvyzuwg4lzo7lTCnafZlFUgXT8Wwhd3+eqhernI+5qbngR9Bt
         FI2QK+F6xGLsBqf5FUyTePGtgrwbnjJYfYj6BO0pgEU6CMYiKlYzDDzH/uJF5/My9tNo
         vORZkjll8vcAkJ0CH7ZElLhdh4sKzW69hwMeX7Y29HZzKvXFBgBipL6APbZ4xDVIHlaR
         eA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787742851; x=1788347651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=idBsAYohvhobxaclJcasJ4HiPtq7OOPdHTu6I6ld/zw=;
        b=lQk3IEuNe5fMghD3ktt+NqGJPOBB4ikonNu86bzAXeXjvvLSMNKV2sD4g7Kp32RorY
         7vMMJkANIj195X1AnWUWibPwJf7x44SBitVEIyioyrI5X3w+Q65eejV356TixnWIhJnQ
         8miDwk8TrFrPH23wEioDjwtAgHg/iL2q1SYomTR7sy54Qkl9m67vUB++NXWU7B1Q2IGx
         h2nYbzL3AqbXEKYf1T1B69mTZMDw+O4ogyBzafrVh8Td5KeFK/jmOWgKxLx6mX8JXRuO
         0wcMxiXW3K8K20tdm0GoZKKy9QUvb87ozc37s93FXJzr1RQDDi1Radhfos8VQGicYGWF
         AZqA==
X-Gm-Message-State: AFuF++mXY9U16v5s3zlNb+jLM7B0NgXLnCT1gEN8sVmB+nzNLJM8vdPm
	btTRmn4CQ251Bcn01SlPEWvDNJuzOPz8LEoAdMwCFs22519uxH0zqQiKKtM8GrUvx6yLPQ==
X-Gm-Gg: AR+sD110yJPUmdfh6OYGzPfYNJFrzQsJowNoJ2MD4NAEVymX7A8mqb02k4vlDZKyEaz
	OhHac71e3n+v5oFf5I81dx8LnywoaSzoNMZV+yvs39J/u650TjpfYSYjBXlBlJ3FWU/VSWDl8pq
	lcyAz/DRHv1otcokjBCr1cspsWRJBmvSg1q06DDZlUPHSi6xlm784mlZ7FBlm8pC6WwTCyHI1qT
	qR3vSXUO9bl0A/cr5cwRyHD0m4I4QkTi2iZgI5zTPaH9Kv5PeN6pF9W5EvCeva3Nr8jCy9iNkf2
	Koy2hVzTJw4ZvYh+pAqavffbjG7VOnr8fc2Bg3MdV6uacdbmBGJOBOfCFUYcji24lZVXgipbqxY
	Xa9Iy+Uklwbr/SOz/SXkuw98QWgavCyeckGOfrVnzG5FMOO5dYc+9NHEi0SekV2zfaW66BfQI99
	EHzi/ANHrQNxI0r+5vMz3eDSoOdwZO6K5srJwwmvECSbyyHtaZ8EqkwaiF15gzxfQMP64boCImv
	uoHQbTw+r2jJgRu
X-Received: by 2002:a17:90b:1fd0:b0:38e:70d5:b12d with SMTP id 98e67ed59e1d1-3966d3ed042mr13867023a91.6.1787742851057;
        Wed, 26 Aug 2026 04:14:11 -0700 (PDT)
Received: from bhoomika.iiitdmj.ac.in ([2401:4900:51d9:f633:eefe:6534:6503:b925])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283fa89e8fsm11529933eec.8.2026.08.26.04.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:14:10 -0700 (PDT)
From: Bhoomika Hardwani <bhoomika.hardwani@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bhoomika Hardwani <bhoomika.hardwani@gmail.com>
Subject: [PATCH] media: radio: si4713: replace msleep() with usleep_range() for delays less than 20ms
Date: Wed, 26 Aug 2026 16:42:45 +0530
Message-Id: <20260826111245.1001693-1-bhoomika.hardwani@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

msleep() isn't precise for delays under 20ms and relies on jiffies, which
can lead to sleeps longer than requested, depending on the system's HZ
configurations.
Replace msleep(3) with usleep_range(3000, 4000) to use high-resolution
timers, without forcing the system to wait unnecessarily.

Signed-off-by: Bhoomika Hardwani <bhoomika.hardwani@gmail.com>
---
 drivers/media/radio/si4713/radio-usb-si4713.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/radio/si4713/radio-usb-si4713.c b/drivers/media/radio/si4713/radio-usb-si4713.c
index 6e6764143e21..62877980fc04 100644
--- a/drivers/media/radio/si4713/radio-usb-si4713.c
+++ b/drivers/media/radio/si4713/radio-usb-si4713.c
@@ -192,7 +192,7 @@ static int si4713_send_startup_command(struct si4713_usb_device *radio)
 		}
 		if (time_is_before_jiffies(until_jiffies))
 			return -EIO;
-		msleep(3);
+		usleep_range(3000, 4000);
 	}
 
 	return retval;
@@ -339,7 +339,7 @@ static int si4713_i2c_read(struct si4713_usb_device *radio, char *data, int len)
 			data[0] = 0;
 			return 0;
 		}
-		msleep(3);
+		usleep_range(3000, 4000);
 	}
 }
 
-- 
2.34.1

