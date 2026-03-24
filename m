Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474FC3F0A9A
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 12:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774354143; cv=none; b=Dk1ORsTBJkOgPj+pkA/oNOo9R0M7/RjxUXUuDJ+nLqmY2Ps1c2IDjJL6iYmD7ZfXibIqrkpCEaZYcJYvqO4RQ+83OoCSkOyXFH886zJn7Bj02S9QCYgAYMpjscMBQ0bLwdlb6skkPf4OMdEQ5YIocWRvHQfcUVmLp5YhUo4lHQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774354143; c=relaxed/simple;
	bh=sq33+YgCPqmEgWSzdWvvek8ZSS7lCrmVWB6qcVZLYsU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WrHcWcW155mbfJOweYvNv+kn9F3y5iJzY+Ijtn259ZxOtQale1EqWnpWV96Pybdsh7MfzAWTfT3CfzbSB31JchsVByA08dl5e5RPZC9DSp60hiqMYf5YtVvknsuPJ85NiHyT3kaY03IzJqCWZItriq3fKfflDs21QAy0wG8a0qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WxFG4wrf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WxFG4wrf"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6BF5B225;
	Tue, 24 Mar 2026 13:07:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774354059;
	bh=sq33+YgCPqmEgWSzdWvvek8ZSS7lCrmVWB6qcVZLYsU=;
	h=Date:From:To:Cc:Subject:From;
	b=WxFG4wrfAvQOp6ACdUqKhqe6rLHBBDONeNAsMSHg3Zd4WZA0fourpEhH9710IzKFp
	 VZfoC6e5WSelJdOFVX3V72zl6nvwLBLx8WT9XYxaOIMR8cKimx2DfdXebqjY6BWqtn
	 4iVFRfwPrcvawEXGpJZ7p8FHdAKP+24LjICFa7gI=
Date: Tue, 24 Mar 2026 14:08:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>
Subject: [GIT PULL FOR v7.0] media: uvcvideo fix
Message-ID: <20260324120855.GA2401834@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Hans, Mauro,

The following changes since commit e8d97c270cb46a2a88739019d0f8547adc7d97da:

  media: verisilicon: Fix kernel panic due to __initconst misuse (2026-03-18 13:17:25 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/uvc.git tags/fixes-media-uvc-20260324

for you to fetch changes up to 5cfbea8eab5bb816df283f898f0b95e789f84753:

  media: uvcvideo: Fix bug in error path of uvc_alloc_urb_buffers (2026-03-24 00:45:21 +0200)

----------------------------------------------------------------
uvcvideo: Fix bug in buffer allocation error path

----------------------------------------------------------------
Ricardo Ribalda (1):
      media: uvcvideo: Fix bug in error path of uvc_alloc_urb_buffers

 drivers/media/usb/uvc/uvc_video.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
Regards,

Laurent Pinchart
