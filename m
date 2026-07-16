Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B791E5702;
	Thu, 16 Jul 2026 02:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784168675; cv=none; b=MrJkn9tpzt8nIK+zVF6iXNI2c8NNmJ8GK3pODb3H6vK3hFveqRlVlzF3s3WIyr+S4LVjlabCt1PoJLeGzkKQyDipM3TgUym+oRQx/I2Assejbor4sPqLl+poK2MGmr3EDiqt00ahzFP5wU77ciJ313/AZrELCS8SlLXiBAcCi1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784168675; c=relaxed/simple;
	bh=WlXlcgPAOfEFqhmjJ1RnkSKS3XS0Nu6KIALrr2qkWqk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZJ8NuAtlH/lQvdJMcBMFiNkBNq8POtVGrO356mmDsSSZq22mI3a7rqjV9QGNx9avSwPurUL6FQxMxw+m5khHHOZL9kL+JAXn5iTcvHxSkN6n8/djDKg5PAQSpj4y/Gb5/2OkxfI3xfXdyZJ/6GpLJmxGUDNgVX4f5Haf2V1ItlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=I6e3mpEt; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="I6e3mpEt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=zx
	GmyBRt3jqb6HhOChT6zHlqDhAbQirz76jp2buLsho=; b=I6e3mpEtFb4O9Wyzic
	A2mCFbZuAAzD8dzrd2LWAR9q9LKpiKiwEx2GvOeEra9ZPjZV9aDS7aegHoJxPr6p
	dI2pY7AjO3JZPjUmZQdJDiAhHcuX/uvDvYxgvL8CzxG5IbWhre+23FFSV2k8Ec1x
	j0AAj6dLhQjRFzHweaFN43+g8=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgA3lErOQFhql9a+GQ--.46811S2;
	Thu, 16 Jul 2026 10:24:14 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: mchehab@kernel.org
Cc: johan@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH v3 0/2] media: s2255: Fix firmware parsing OOB and cleanup coding style
Date: Thu, 16 Jul 2026 10:23:56 +0800
Message-Id: <20260716022358.161471-1-huanglei814@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgA3lErOQFhql9a+GQ--.46811S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtw4DZFyxXry5ArWUJF4kCrg_yoWkKrg_uF
	y0qFyxCr10yFZ8JF47KFnxArWrtrWUWFyrZa4vv3yYyr13Aw15uF40kr4vvF1UWayFyFsr
	Cwn8Aan2vwnI9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8Ta0DUUUUU==
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC8w7z6mpYQM6EawAA33

From: Lei Huang <huanglei@kylinos.cn>

Hi maintainers and reviewers,

This patch series includes two improvements for the s2255 USB driver,
specifically focusing on the s2255_probe() function.

Patch 1/2 fixes a potential out-of-bounds memory access vulnerability.
The driver previously read firmware marker data from the end of the blob
without validating the file size. If the firmware is smaller than 8 bytes,
this leads to an underflow and invalid memory access. This patch adds a
size check to ensure safe access.

Patch 2/2 is a cosmetic cleanup that renames CamelCase goto labels to
snake_case to comply with the Linux kernel coding style. This improves
readability and consistency with the rest of the kernel tree. While this
patch introduces no functional changes, it touches the same error-handling
paths modified in the first patch, so they are submitted together for
contextual clarity.

Lei Huang (2):
  media: s2255: check firmware size before reading trailing marker
  media: s2255: Rename CamelCase goto labels to snake_case

 drivers/media/usb/s2255/s2255drv.c | 41 +++++++++++++++++-------------
 1 file changed, 23 insertions(+), 18 deletions(-)

-- 
2.25.1

