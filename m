Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356699;
	b=YHk4qbIyaP2KXlbL/1wGEU7Nw7fnzatjPtRY5cVQU9PQJt+RbXxgoeaujZVsaCRg8swU
	 ADLYi+JYa5ibEbnwObLeL1kekazzjl7h+xjk9OdT52BcUeeJ3avkM69+eQYk0dgyPtuQZ
	 mPBhRk7KR//j9yBYBTQpX96OYXrtyeZ98B3HpNn2cW1wH/FZABE2CSUkFmoIz61gKSO7w
	 09N5kaHR34z2GGMJuQ95Pg+LGczzha2+uKFGL1qWNrD3iDhWlWnEM7yaYX1A4zMyTMJR1
	 GP7aqEpqt/3WXykYwR8t8WzorGstOwwTuG4jQ+VJqfg/gLW/Awx+m4j6IoDm4tOTWjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356699;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=NIZOywob9urHRENRsTw37MeOnA0o4dqhN2tZvvBb28g=;
	b=kgEfdaUEYztLTazvrSs5zvd0CC4nvkas9iM7hXYL4av8lsCqugHtZ2N0yu9cq/8Awn2Z
	 g/36VRL7dxJr+784Ftl6y2RJrmKsXRrC3591dtJ+hljGzTxxramOfc+TecCYq1NTaNvDj
	 ZlDscLBLfjrfSNeomCInuOxJ08AxAM6Ka0hPfHynM4Rse6TEqHiI1/PGyfvVsxgywaCr6
	 tkGKd75ldx9sl17MDPEBOfutDFSwmKfk407cM7yRWqQos6fcBk2BXCtHQkWZ9xsy/m7xx
	 gxB9JpCK9B3uCQ94E1zrfLsh30WX6zkFNpigLbYvu3sNyfaWdvg19v6t6uMHt3XPzyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=LcD+dLcc;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBB8606A31D
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 10:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDBB8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=LcD+dLcc
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98040874;
	Fri, 30 Oct 2026 11:36:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793356562;
	bh=/RaQGRWsYONbPZK4LIeEpzYG3ADIKxOo6y6ZktnEeXM=;
	h=From:To:Cc:Subject:Date:From;
	b=LcD+dLcczygieoAbDb+JVqCyT23Xg4KYn4sXjwDVsEGe+k7vSqIc2ar6TRXA7n/xI
	 6wJn2r3vC8xMIevfTgJDVxHpIwWvaj5MpFl4XlzNHXVNC3xNOliX7xPnI7GwNDtbam
	 w4YZ9YmNJxAgwOZ64R7dZNYA1kYpaqzeZsMBZZNc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH] Documentation: media: Document impact of errors on buffer fields
Date: Fri, 30 Oct 2026 12:38:15 +0200
Message-ID: <20261030103815.3098340-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When an error occurs related to a captured buffer, hardware can produce
less data than expected (or no data at all), and timestamps may be
unreliable or unavailable if the device uses hardware timestamping.
Document this in the description of the V4L2_BUF_FLAG_ERROR flag.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
I've posted a corresponding fix to v4l2-compliance in [1] to relax the
bytesused and timestamp checks.

[1] https://lore.kernel.org/linux-media/20261030103717.3098080-1-laurent.pinchart@ideasonboard.com
---
 Documentation/userspace-api/media/v4l/buffer.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
index 94dc2719e907..5a7a1511cee7 100644
--- a/Documentation/userspace-api/media/v4l/buffer.rst
+++ b/Documentation/userspace-api/media/v4l/buffer.rst
@@ -503,6 +503,11 @@ Buffer Flags
 	streaming may continue as normal and the buffer may be reused
 	normally. Drivers set this flag when the ``VIDIOC_DQBUF`` ioctl is
 	called.
+
+	Depending on the type of error, the buffer may contain less or no
+	data. In such cases the ``bytesused`` field can be lower than expected,
+	including being zero. The ``timestamp`` field may also be zero or be
+	otherwise unreliable.
     * .. _`V4L2-BUF-FLAG-IN-REQUEST`:
 
       - ``V4L2_BUF_FLAG_IN_REQUEST``

base-commit: 27285b099fbc5cb2ae3aef20f3bbd7b3c88b3005
-- 
Regards,

Laurent Pinchart

