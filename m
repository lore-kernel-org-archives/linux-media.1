Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649D93876B7
	for <linux-media@vger.kernel.org>; Sat,  5 Sep 2026 14:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788619065; cv=none; b=UMoKhXftB1z+qYdL9em1M46N3RkMvZ2eJhegH1qLydnB9sBHti7dcTwg86JzcC2ukGTKZoVTeCgIPAE7hg6hyoBjj4+MWkO77jY33alR4SJGylFcN/7V7lB2to3Xyfa6KJz4iXI+hIRuBb58N0v1ZlviYm3dpO2PyzW6/jdDduw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788619065; c=relaxed/simple;
	bh=ysevVIWJ5TtntjDXiekqdlkXzHSTlLCPSnJtv8zueuU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EMOjWwesC6v8tSQYXSBcE1cRkAn7mJEW1X7wXWGurJ/fDlW0yd1xDI5uiJdlYCru4IavcBnGgus0AGF8ZGB2QvHNZWM973qQw+h9O001Zja99xZKuTTseBHzxZf14XpI8rwWzTicEz9bFj/Qz+q1LSmQ5QB/HcfeeeTUbT4BqhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tDUdNFr3; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tDUdNFr3"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5bfaa014978so913827e0c.3
        for <linux-media@vger.kernel.org>; Sat, 05 Sep 2026 07:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788619063; x=1789223863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ysevVIWJ5TtntjDXiekqdlkXzHSTlLCPSnJtv8zueuU=;
        b=tDUdNFr3V0K4/yIuRF5DH2iYLzo4cGsw1Y1EeTA16NZULeqbxDsUKl5AfG8CmxrLH6
         2/k2RbG6bC28yn4wJC04aTqXXxiGbK8fkFNR5MXE9b/XJDJZ/QHZzuHxA4Bu825F/5Zl
         euFN6Bf/yKMJC6fHG4RvbhxfeGFS7Z6jAk2enrVb6Caj09VcvRQ58B41W+lPBUHOlzrc
         Q+gDFQouF99rwdnlWXyTHz+6s6XFrbarVNBGACKrFvsLFiW1UBhypQ44FcqSYR1P2GeS
         Ln9nF2fS4FKRxodQAGbtEy5mdFxYMreBY2zZtJOz6qmPa0T16kbLMg5BF5Gf6hy5kn3K
         4zvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788619063; x=1789223863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ysevVIWJ5TtntjDXiekqdlkXzHSTlLCPSnJtv8zueuU=;
        b=ITWN/Svp3iYusPhskOCfmBUyL5gnbEXrZDnBy2SWErjXNx72INE03AowQYMspIzZNy
         ZewP1t/PT3bQljiq7r8ggWD/lRBzo4+Pvr/5m+JkxTlX8B6rX7WxN6lXZUqDrGSUvtps
         4W8GGbZCTE/8qD21FH2B6YVFYsc7T7q9X+HhIu/uCyREgxIxwkqAiRDTtTIUWWviSDt1
         iyaGWIs4F0lZNkScXqK4KKhvgzm09SBQ3Q/qZ6g31IOg0mAm5Nulrn/HfgEVDtBz4uyt
         pNdTUJGAX1XIlRwL+oEWM5Ogi2uWqOopD1KE/shjvNAvkXhL/elaMuR6cXKZM6fr9q6D
         u//Q==
X-Forwarded-Encrypted: i=1; AKwUvBwOMTNcqJ9Td5IEmjVmwoXSuXRmuBFTMzm/Ug33qrCSF2IHj0gYsO3ANY7CV2Z6Omi7NuTB2D2z6sBC6g==@vger.kernel.org
X-Gm-Message-State: AFuF++meY5xUVWhOHM8LWebonKE2awhnsX88gplANjvMMU4ywDweLWA7
	rL3/EKi4u2AmAogEmFIHaydPLUvCjWteqmyDTSQxkGNA1nCYOwSGVYglL63Bkf9y
X-Gm-Gg: AYBFou136xhTUzeerOpAottENXNrmI5jiYFIYIu4JQtwuQP5pDTuaZTivm2TeW0s9Lq
	QKB4pxBVI3WmSR+hTmdCTz9AsjasfTY+UawS3mmLjTH8N7NFNNawheUT0dhegNFJmoy7eg6Fn0v
	mIAAkPd5eTaMiHHKu8oed63opYXJHD2MK7pbpwUqcoHVOUMok/u2J4+2dWWtqlQUMepAYl+MQ+v
	F+rpamoqFgStPeGaT4TgnqpejeyX/3lZ27959P8kEgBrHDpcSUHlATE1umXkVb6IOQRFk3qVSUX
	zLvFkZpkzMZ+ojBiOi0IeYkTQDzCF9Y/jCvBxOe48BtLnC5zAVU8EfELLO8OizAw4gKE3qKPJmh
	n8PklRJzPqaVpJS8Q+umWNm2jaPBS5/VpqKG6a0P69Z9xWI66CkL8IkIC1yIqccQ85K1wKamq/J
	P5cqHlR+ZPKhOQ242gg8E2fO+kpK1lYFbODARGCEMmfJ8jWiKIwiqXpp1AgRX1pOUp7G5NsgsYA
	Oa6Ov5kI1CN7Q+EU4jXwx2k9eRxS93qtQ==
X-Received: by 2002:a05:6122:1d50:b0:5c6:81c2:5496 with SMTP id 71dfb90a1353d-5c7ed7a8eaamr4533368e0c.4.1788619063063;
        Sat, 05 Sep 2026 07:37:43 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ecac1033sm4248210e0c.18.2026.09.05.07.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 07:37:41 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-media@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Request to withdraw all current and past patch submissions
Date: Sat,  5 Sep 2026 11:37:37 -0300
Message-ID: <20260905143737.25125-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

Please discard all patch series and submissions associated with my name, including all past contributions and current ones. I would like to completely withdraw my contributions at this time.

All the patches created by me contain many errors due to my lack of thorough review. I am very sorry for this kind of behavior and for any inconvenience caused to the maintainers and the community. I tend to overlook these verification steps, but I promise that in the future I will review everything properly and correctly before any submission.

Thank you very much for your time, patience, and understanding.

Best regards,
Breno Rodrigues Alves
