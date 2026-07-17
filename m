Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E845388E6B;
	Fri, 17 Jul 2026 11:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286318; cv=none; b=iSJdE8F2Hbzi/7zI8iQNcWHXfgz4QznrtouebLP54suX2sO6vqrS/o5iMOC3mwbHUoNortOEN0IOPRf0GqnXuR00Z1b5yRB8pfBH4KkJonYRrtndvx5VNQmZhdoLGn08IvpbckVbg/SgoP+aV6G7ty/fxRUT1VF5iP+90eT9dHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286318; c=relaxed/simple;
	bh=9oyv0oRvyx/vg5QftcwUjEylNuPNzPNtB39M17ApURQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NOTlsv1WYda95aZeqFq7gjBTOwG5rAwZWYLr2PsjEVRZzuGQBY7uuX3ewZifvHxxxTXtpAnk9d3MAjT3qOFJcRznaeYZb1c5rq/Cs65By17ZaIUDm6jupDXSyG2iSFEnXeB9g+noDyfFQEQh11goQ1frTuY/P0WmpOfZd1xPsd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G9dMUpXo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G9dMUpXo"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:66a6:48e1:9e1:50d5:c75c])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 154E2130E;
	Fri, 17 Jul 2026 13:04:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784286255;
	bh=9oyv0oRvyx/vg5QftcwUjEylNuPNzPNtB39M17ApURQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=G9dMUpXoVwsoxNPV6gcL4nFOKyqNOYuggj/UWAxwMiFMwBqeuXDwkpNa/OfIKg90e
	 QoiE7VaKqlNNeg7r8Sps4iY9Qfld+gJ/NV4MGJy+R0K+aJlphvdBP9WZ3dKAWJCxOC
	 ZvXoJoOqXyF5ywfMijmqx51WZH4Gm61inxZYr+Fo=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 17 Jul 2026 16:34:16 +0530
Subject: [PATCH v3 1/9] platform/raspberrypi: vchiq-mmal: Include missing
 headers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-vchiq-isp-v3-1-fb8235e15c68@ideasonboard.com>
References: <20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com>
In-Reply-To: <20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=919;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=9oyv0oRvyx/vg5QftcwUjEylNuPNzPNtB39M17ApURQ=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqWgxUNPc5yu8OKu87MGd8gVWvppRHROVq8oteq
 CNpangNu4GJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaloMVAAKCRBD3pH5JJpx
 RSZJD/4xAqR6Sxd2yIhoOWkOYovEUeMvxchlgWOTFhSprtFVp6Te23OjZ2JysCUYzX8gkNIuydi
 t26jBFWQnVgJ3E4HKJlyRMV1mKGIhqKp9lRHMCPauaqBZy9tPEyN14bjFuZkRZZ41xgTEHSVVD2
 VNoSNgu+9tIVkOkPPA4wo8gL6VhiqEE238C4N0S1Oqe/owyzxMGZZRqrep7hs2FT564s+tC2Y2T
 c0trIkAqc634Wy1j91btxjoQNM4ak3ANA4Yreg8NPKffRAPp3GCAv1YxaFcq57usURLzNi5S+KE
 j8Va4ZXJ+Q6BEkxdkcEf+Pjv08l8zmS9ig8hBkZrVJLb/pbvcce7UwBT3C1nbElGlA+iKWX3z2l
 n5dS6fTUhJBXtaewgKiIEa16IKHERGFktvZoNTpXc02onmRKYJs6vfdNm43PyLV9jGmCJXoGrds
 PypXZWSm6zKtu2FLxwwO76ckJsSyVg9Yfnf7LOa6UQxYxlGLTdBT3gEATOnXUrEfIjB4+vRAtgE
 1bYK6X9v2DbrfP+eSv59YyFDaHbHoyAGXiaiOsYHL4Ukli9M6O3axfd4xTX0j8/ol8/sG4uwlHw
 F29msF8urlqj1v508vmmNXi1rkbQmXOawnGc06fTua4ujvryUjDG2E7JY6ml3ryIb1x2sxAxNqH
 695mhr18rdXthgQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The structures defined in mmal-common.h use types related to lists and
videobuf2 framework, but are missing the explicit includes for them.
Include those.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h b/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
index 6c5092a68b99..c9976bdd7490 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
@@ -16,6 +16,10 @@
 #ifndef MMAL_COMMON_H
 #define MMAL_COMMON_H
 
+#include <linux/list.h>
+#include <linux/types.h>
+#include <media/videobuf2-v4l2.h>
+
 #define MMAL_FOURCC(a, b, c, d) ((a) | (b << 8) | (c << 16) | (d << 24))
 #define MMAL_MAGIC MMAL_FOURCC('m', 'm', 'a', 'l')
 

-- 
2.54.0

