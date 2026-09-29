Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C989C524AE5
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 14:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790692660; cv=none; b=lK7FQfKzI6jsdyWVj5yS7L5sXpzuSBEaJAa/7Y6VSwMZecQ5JpjyCJCa1Z3uKugcCNsYenVrVcbW0dK4tZsYPWjCAISul4dxzkk4NZtWJQrU8Ad07qrey03PUXCcip1FUFELNQ8Zb1KmF2xEnp75q+ZDOfeEzvXsPGWb7Q/zo9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790692660; c=relaxed/simple;
	bh=8jeJ3YJO45J2oYVr3ApJb5fJ6SYGUA4846QEuWZklGo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a41gBU7i6Do04pdPniQUa/3thWih5DuvouuRiO1KLfIlh5P9bwNele0yydAwsWCgg0Tac6Nlw2gJXQP4RXBxYaXnQaUJPyxweAzV+zdZOs32EODm4DyexO4UZ0bCQTEogZ5/fJ0WGzJw1jvGHotDUHsz6VbPpWcntDkZK890VZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pt979KQ3; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pt979KQ3"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so24188255e9.3
        for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 07:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790692655; x=1791297455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VWqinP7Zno7DcSlkiFvqjdgX8G+hgdcZR7wuZugNU3I=;
        b=pt979KQ3EOJQEYxoi0wqZ+4+H3VbHjAVxrJnfuQTmnbMEzy+vdtzDJ0CSxr1/B7uKj
         tgy2PMonNyCcwegdUutbrG5itiqkAJgRIkiA6e0ACUsSJVkEIuBnHlFMfH5rhJswrjFa
         rJrQ+gWEx/cDnVouttHQFFnvCIyVKyUCY7evIQ320Pde4i1kHBRKgMxScZrqSzNfAucu
         YZktcLFlkvPUo/LVCByYiBUH/eHtQOa5BDNjY2GyuxsYUi5f4SP2ThIxuPb7KGy0QPNX
         tVNKNJRNZnq7aJvmQX8lJfR32mwUU1mWc8/lXWlc9md+BVu3MbAjkDAVumNC04jRn+Ds
         tCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790692655; x=1791297455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VWqinP7Zno7DcSlkiFvqjdgX8G+hgdcZR7wuZugNU3I=;
        b=s+AXR4tSc/5KNF5jAEpssKFLUzDwaeOHabm8OEYLZy3xIkCdj+OskZ4leyj4aB3c9Y
         9DLcIhQ+qJAgDP3qLlWpzFEq6cMcMoBaOzsXDAp9AK+IS45mZ6zrWS71pw74dEuiWXPk
         x3oPU8Dj+PDEryaWokvW64VNJVrXjVNozrkVYrr9yaNAMGtrbon/L0+iOBtFXn+vgF0v
         XR3AbZzjDLiH/jFLzwpNllBy/cpc7SqRcXhfKgYghrZTiIm2YzNlwv8KMov7DjHtUUeZ
         lOJ8UoQNANwpG8dgUJMrcbCtPoCymrCmjeuvdVDhGUQRRS9l7NI8ZPBkyL0yeMl9uC2W
         AX1Q==
X-Gm-Message-State: AFuF++lro8WuG2mpGN6a/pN52D+coCo60rD9D1SY42KuYeQCi3ViCYla
	QqRWqzsYe/BeowFw2GB44cxAK6/9rd6eYUgezfXPcb5Xu1IC7qlEo4FCLeR/Yw==
X-Gm-Gg: AYBFou3kgCL46swIZS7X4//ClQt9uyIYkyWpaDOSlUsVt/H0UqFxBXc7cxzXk7B/C+p
	3xY/AnGmTZvTke2aU7kDXK3fH0AC6v5RbnYy1QHcoQCwyGp6Yw+rjpRrMKE8r9abwP8XcJgG2G+
	EPfKj6jaYPudaevoG3qJ6+NN5x/YGQ76lRv7rxE+4DJUs/ysSFUwrTXZRh3gx748JHR3FOa1l9h
	qvhwKCqbo2dWJ7ArcR48IsPr8lc0prP+RMr6hHxGEODwCW5wMkuQjFGEbOZe1s98y+WT12vbKSE
	pJ9kw2SrtR4xaAMlIujtNLkUR2rFkrqJ7dl2y9bp8Xe5107v1+f03N0U5i7NYgfIq/KDGoVnMdf
	rXmZs+sQdnSi8hhuyqMuMGmqt4uY1DT4p8ftQbfsbobJy8FPV9hB5A9BHq070q/3h6zxgRmI2YO
	FCRQ1Ye0pTLGw8JqMv1sjjS/G5mm3pHaMI/5HYWOIBRE2aTyZbeRjrmXgwrQ5MK2H/65fS1n0yV
	jdfu3Pej+GIL31bPhTFcVWMp/Q5C0yIsxYSmGGb1FITLYNfWRjTvRy/fvg=
X-Received: by 2002:a05:600c:3ba9:b0:49f:fe48:d177 with SMTP id 5b1f17b1804b1-49ffe48d294mr195955825e9.32.1790692654751;
        Tue, 29 Sep 2026 07:37:34 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf8f93csm89716995e9.5.2026.09.29.07.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:37:34 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Sarang Sapre <sarang.sapre@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v2 0/3] media: ipu6: ipu7 and ipu6 fw-isys fixes
Date: Tue, 29 Sep 2026 15:37:28 +0100
Message-ID: <20260929143731.43358-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the firmware config leaks on every stream start in both the ipu7 and
ipu6 fw-isys init paths, and a NULL dereference on a PIN_DATA_READY
response for an unconfigured ipu7 output pin.

Changes in v2:
- 1/3: use goto labels for error handling (Sakari)
- 2/3: new, same leak in ipu6_isys_fwcom_cfg_init() (Sakari), also check
  its return value
- 3/3: unchanged

v1: https://lore.kernel.org/linux-media/20260927201631.153126-1-devnexen@gmail.com/

David Carlier (3):
  media: ipu6: Fix ipu7 firmware context leak on stream start
  media: ipu6: Fix firmware config leak on stream start
  media: ipu6: Check the ipu7 output pin queue before completing a
    buffer

 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c | 34 +++++++++++++++------
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c | 26 ++++++++++------
 2 files changed, 41 insertions(+), 19 deletions(-)


base-commit: 2dcdfb625c3b8fe87454e19dfbc54b3e3f0ad70e
-- 
2.55.0

