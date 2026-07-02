Received: from mail-lr2-f3.google.com (mail-lr2-f3.google.com [74.125.230.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E850242A7AD
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 13:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783000577; cv=none; b=C/3VwmQjM8v1xH4UFl7svztMj+7zJHENeXTGP4vVf3R6dZ/El4WTYl3mtUs0W1zKfP9IuFBWD2jF8pT8UD+KlGdHCpMfNvVmaLpd6godY446rR9LTZsr1+If60ZedwgkNVEPOJ+JDxpoS5KWcN35I6hNq4PNqkZT3Fxo0IVtcLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783000577; c=relaxed/simple;
	bh=UaVEUdRAGtC7aLKhUviK1MAizQJj6stdK5GFApCJui0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lWU1dGCPSqymgxwOUGiN8Q/fO6+kgSI1gcBZBi8kZ6EFluSwRX1j4loIYQ8V6ullMbz18MVDec4A6FFn4zP4+EmNPxTZ793+KjpmsBoiOlTMPvXHOfPERRtjrIi98lA4TEBq/VdYZrZNeuknr8WFpPSSe0wkUwzQMLalbPP1hvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CclShmgB; arc=none smtp.client-ip=74.125.230.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CclShmgB"
Received: by mail-lr2-f3.google.com with SMTP id 38308e7fff4ca-39ac6372d25so7283731fa.1
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 06:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783000574; x=1783605374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4JyGNpvvoY2EfnwsLcpSI0KMTB87kuQf0AOS0r1gf6I=;
        b=CclShmgB3yqgy36IFdAWixjoLRWUTqyaV+wjm2jIBu1EbTTIGQu4tg68YAk22da/JO
         1+ZcyyRjc+oqHQ4mA2toVkH4GsE5SDW34352bNAPwxiCepw42v+VN0Q9dSS8j9vG9Hcn
         xBTx1EUbuJQIZR6lGTR4qD7MaJ7MuXN5PcE2K96gpcxSH4Y41+xIWscyl4V3u3oz4z8T
         pNxJ+ohTZtSXDRZjyiEpzmIFsGa/vCZttVrWnHlVdWOa06qdhAkSa0jb5ET7lmuRb5gE
         w8v+9nWSN3Uz92B+mrMjzJISOx0o7IjIW3nChr4OzCyZXx0J9KnN3OB9CMDAypW9N2nu
         xpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783000574; x=1783605374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4JyGNpvvoY2EfnwsLcpSI0KMTB87kuQf0AOS0r1gf6I=;
        b=RaIIT77FnaoDN9308e1TJEWnNn1vcSq3wnxkBBdkN/KJDyD6569qyhDQpeNj+tpSwp
         8PC0bmcTVOO9p7ypcOhWldHVPgb3/mIQWFDSMnJRTgNYSU62l37AmYT48GF4mS4ES8cN
         cjGHxXgx0rRNNJov0aAsjvfKOUdZZL2WOqfmfjpr3HCeC6Q85W3HdOckU4yZqsZ5bmXV
         Hw2Fw0KQhh7gDMH9zrC1GEMWZ94TunHCXN0S05gajWZaTle320mRbSfjivENCD1v8/xg
         A8OiNU19A2TerMU9F0/OD6NhyEyVvSrryAHlObrFNp0bI5lAg2fd9S6Q/l9hZnDaN7Fx
         G2dA==
X-Gm-Message-State: AOJu0YxFGk5y7XxGNxvKMHCrH+CsggtBfj/F0ER3UwpCYXkRKwLaW7dR
	qhNao87oLAU6kyn20p8Et3YO9q3UlPNMzmSMWSSvrrhb92fOsIU3t3+n
X-Gm-Gg: AfdE7cnuVd8xnpnKp/4jsYfz5cbbqEzmfsqEYixUJbM57091Ry+D37pDJjJBcm6RoGd
	XQOA6VNGWGSqoh7sV3CYLA6nG18vxgdoxn2jIaG42dIUJjB8abvzFXDzznpH1GnOJyKSKMCvAUh
	zc+TIvOcRFDpc0tWV3bA/M9R8ePffb4Iw3VbpJO9rbBRA9eZz8tjjLgdbutSTcG3bma5QM3OB64
	+BXxs/MfklcuMRWCtIFs0gnsMTFspSBEQUqKoF1XuWpJqHSc2WLavvbiSELFEjb1iScfDh+oGpd
	aLfSGcet2v4q44Awqn1gJ+1A8a0jmoR7G5Q6q1qxok8KUm2KCi0XA7e4EzgRHNIdkJy9Us7RvQ6
	KitscWIHOFc+thB286yR1KhMc1c9ms4VYGVn8GWyxXCXK6tuYh96I3tMVqpxm6+8Zp7tCu+1ur8
	gvpS8eC5Aa
X-Received: by 2002:a05:6512:6887:b0:5ae:b77f:f823 with SMTP id 2adb3069b0e04-5aec80196c6mr934774e87.15.1783000573989;
        Thu, 02 Jul 2026 06:56:13 -0700 (PDT)
Received: from arch ([93.177.236.219])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89919bcsm720820e87.11.2026.07.02.06.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 06:56:13 -0700 (PDT)
From: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Bohdan D. Marcus" <bohdandmarcus@gmail.com>
Subject: [PATCH 0/3] media: atomisp: clean up block comment formatting
Date: Thu,  2 Jul 2026 16:52:27 +0300
Message-ID: <20260702135230.19030-1-bohdandmarcus@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses the block comment formatting issues across
several header files in the atomisp driver, as suggested in previous
reviews. The comments have been reformatted to comply with the Linux
kernel coding style guidelines.

Checkpatch reports no remaining errors or warnings for these files.

Bohdan D. Marcus (3):
  media: atomisp: fix block comment formatting in atomisp_internal.h
  media: atomisp: fix block comment formatting in ia_css_mipi.h
  media: atomisp: fix block comment formatting in ia_css_timer.h

 .../media/atomisp/pci/atomisp_internal.h      |  3 +-
 .../staging/media/atomisp/pci/ia_css_mipi.h   |  6 ++-
 .../staging/media/atomisp/pci/ia_css_timer.h  | 49 +++++++++++--------
 3 files changed, 34 insertions(+), 24 deletions(-)

-- 
2.55.0

