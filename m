Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB57B49B44D
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 10:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370230; cv=none; b=HewfhBYkQhjpDJZ/YIYlM62C+209JfAycqRpTuOQ5XiotgA8mJze0LmRXySCceHIJyhwcxFGKJ7EJQ9Ht52D6UoQ5uZeBNWMZPy6zS9omNKq6lItGcZgsms4xeq3AMg4TXvo27TuEc4CI+ozZF9u/2BgW0cryl4cFXx9K2b5Iu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370230; c=relaxed/simple;
	bh=Rqq82mXap3QWi8qxupFNRiibC+E7mkRico8pb8TXSx4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rv9T5oTD4ng+ZkAGyTIsNZx7ZyJ6uUkPjPfTd0pDomWcHaFLE5nriK9JIAfGkrK15hmdqNLxkmp/bdaBzRtQGO4ya9wOBsdaPEuYds4JC1z9NSIe9iFoorB6cCA47wfM9iG2rAuvJ3eouR96sidDpCvTooZ2XYGSzvJoxxDh+CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fWNMhMMj; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fWNMhMMj"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-891d19d00ceso209654b3a.2
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 03:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791370193; x=1791974993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q7ewnhiOAYTkhckTbYMDVbfEbiyDiHZjPtjjAe7KL24=;
        b=fWNMhMMjTXKiA4GiwS5OUZ5+HpQmcXXcNfDLBepQPSL0m2KXUu89Is8I6YYerPVQfD
         0u0Nbt749WtIFutDDNDrBUcHr+6Yw0XQSYoZrFAQYOMtMQbmX7GudFpVZlnNzl/PC5Fb
         yDuPDwu/SAIUj/E5iWU+aQ7EDW2FVSsKmxmDyNPFIIlpbqtNNQaq/34h5mQ5QVyAj+X+
         Y/PnTjW2MCFjsadr9G2R8bug4sRf0x9Iko2tOZ5O+iXnJEhMi/fUqSKO0ulJIwQGz2Xb
         S4Bj/8URmzuLhH/2nyJq8EPC/iBNChEuifMdlMh24MrosAvBiF3EKAIsJGWZMbD3qxpw
         a+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791370193; x=1791974993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q7ewnhiOAYTkhckTbYMDVbfEbiyDiHZjPtjjAe7KL24=;
        b=S/62BKCLy47HgOb8hjhur7nYKgPIDmzl/zO4UEt4/yTwCjyoVrCFC9qPsEFkuuvoPo
         i4bfe3sEx1C7efcnFrascuJLd0x254C33vQAdWWlpZ7rM3qyTF8JTnufQp8QfdncEh4V
         nBOdIB6G/b1D7g3t8QbBFJ0YnxnzSK6hIJValqZ1FZvf7uyvJ7WVMdjSTY+OObUC/0SA
         lMKHU7XGiA+6GoK4em/zJkVaZod+IbmaKdWJB+UVESBQQEtgiu83MvPc5uyRxJ2LYhyY
         gR/vELwpZLp+yOzVs37r/twXZGdEEBgC64aM0zKXHsRLHy4CvSgC5ksQHZ1mZ6/slwAs
         /wig==
X-Forwarded-Encrypted: i=1; AKwUvBwq4oMX6vVQyx9Ksiaggxk43S1c8EhPtrOoEynBuGlbfWx/yudce+5ivO98YO2lEdYERLLdoHVGfEpd+g==@vger.kernel.org
X-Gm-Message-State: AFuF++lVVcgyxzkUfoOic4WP2vTcq5j8H+Dy3TqsQEVWLwxhNJvUpK/e
	SsgXIaU0F/pqiQSdpIwAl+PFrStsO8JdD3JAfAE7DMSMMaQSiw3ZmX2bxOXNlQ==
X-Gm-Gg: AYBFou25bqzvEAJVCOnQJqgnHtBpCJiJqC22I62CCPTqTJWZS6QUIi8eRevcLUnlrYQ
	Tdb68hbyG2ALktTClaTWXZKy/8Fhy+uLFMCvkMkplSy9FmvC256ecnkAOyjtzyqrXwCFjSlzR7x
	zPYnYv4TI0U4dFrP5BOsmO/YBXXiQ45abpX5n87wA7KGcLKxkgTLbvXQVW70ku6brCLqLL6APZa
	cgg7zFW7CeeeejC2XiWEXhmHuhgfd45nyHgGhBCQXF8GWx7+GADOQVdX5UKJwYCQc+371oZCGEJ
	4GotDLUJv1r+lEfInDfwU9dvyjbBRIPKKTCLThekisjkZfL/X38OOs+SQ8LTHk4+KC9l3yzjghS
	OzB4muJ0KiohWeInqDHvUcjDX+Jpb+SyYmkLK2/OGQkNk2p/x+h/R3Pet3cwLTwly61doNyqabx
	F6TJRaeG5lXI2liN37fIvfTNGsvcR7fKVOfZEbQ6X5dMPPoUJefSo+HwLg1EdTYatEWufxcxWq/
	RMIFJHMKAyhzWvgsb67toYZV377uSEeTZfxp1pRWMLrUTylB066e+IuQZJMRPwXrGudRFLMgf8N
	tLbd8IPd2iQKcA==
X-Received: by 2002:a05:6a00:4106:b0:880:4b56:dc2c with SMTP id d2e1a72fcca58-891b138dd1emr1529776b3a.34.1791370192900;
        Wed, 07 Oct 2026 03:49:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8918891808bsm1197898b3a.10.2026.10.07.03.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:49:52 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Shunqian Zheng <zhengsq@rock-chips.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Luca Weiss <luca@lucaweiss.eu>,
	Hans Verkuil <hverkuil@kernel.org>,
	Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/3] media: i2c: propagate GPIO errors
Date: Wed,  7 Oct 2026 17:49:36 +0700
Message-ID: <20261007104940.507820-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

Some drivers use devm_gpiod_get_optional(), but do not properly handle
errors returned by the GPIO lookup.

This series fixes the error handling in three drivers by propagating
the errors returned by devm_gpiod_get_optional().

Compile-tested only.

Best regards,
Phuc

bui duc phuc (3):
  media: i2c: ov2685: propagate reset GPIO errors
  media: i2c: ov2732: propagate GPIO errors
  media: i2c: ov5647: propagate pwdn GPIO errors

 drivers/media/i2c/ov2685.c | 7 +++----
 drivers/media/i2c/ov2732.c | 6 ++++++
 drivers/media/i2c/ov5647.c | 7 +++----
 3 files changed, 12 insertions(+), 8 deletions(-)

-- 
2.43.0

