Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A4B331ED4
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 15:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785165038; cv=none; b=mAYpF2NxfTtmCUIpTztrAiCEKYwy0q6Ios2/0mDSYy9ZcXUaWwTwBfCDFJQ39D15C8+tEFpUTC4lZzQJMqnhSj4K8ue76Wx8gTn8+C7R42H9XOwX+7DNH1ZtJ4Z66rI1ZqLv81TDHmHZrVihzExf3L0tqqtyE+059LArWmcGy8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785165038; c=relaxed/simple;
	bh=7aDQ/s7cH2i5PMnPXj7YkLlF2LbrtZmIhHdObtwb74k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bsqYPyihXnULTg5TUBoXzhOp/kcmTrjIe8rxQXLNVS1VqFi+Ngxe1aoRhkp+iA8GFiVTHeZTEWBTw52KOto4tu1nSQy7DPiVKu3lToZu/KtD16nkHKrdoIEOV0itUVXXMZdVgkue9eo2lXxUu74Sz08hpvYXEErfl/Q+VeDeZWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G6e/3YlV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G6e/3YlV"
Received: from ideasonboard.com (mob-5-90-50-102.net.vodafone.it [5.90.50.102])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E84F4492;
	Mon, 27 Jul 2026 17:09:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785164971;
	bh=7aDQ/s7cH2i5PMnPXj7YkLlF2LbrtZmIhHdObtwb74k=;
	h=Date:From:To:Cc:Subject:From;
	b=G6e/3YlVCbYJ2m+zYOj54HXpfqFPddyoWxxdfwkizXABXgqVf3Z4mfnBH5R5oP8og
	 9qBe5E9Yo42asJffKh5Hcwe7koR3rHlQR9yEgVTEofNnxV6K0n4w4CCn6m/ZNv63HJ
	 EovBUAVovZjXOEgJVvULFEgB2PMYVGV2uh3i5xtE=
Date: Mon, 27 Jul 2026 17:10:31 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Hans Verkuil <hans@jjverkuil.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, David Carlier <devnexen@gmail.com>
Subject: [GIT PULL FOR v7.3] Changes for ARM Mali-C55
Message-ID: <amd0FAm8_OcHEKoQ@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Hans, Mauro

The following changes since commit a52e6f7923c17a672135b485ffd96fbd72f46267:

  media: chips-media: wave5: Resume device before setting EOS flag (2026-07-17 12:36:49 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/jmondi.git tags/mali-ivc-cru-for-v7.3

for you to fetch changes up to 4b42085b8c5843cb7854e33cc958a5b464fd27ce:

  media: mali-c55: Add support for RGB Gamma (2026-07-27 12:56:16 +0200)

----------------------------------------------------------------
Mali-C55 fixed and new features for v7.3

Collect a few fixes and introduce support for RGB Gamma and CCM

CI pipeline
https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1714400

Please ignore the media-checkstyle error (see
https://gitlab.freedesktop.org/linux-media/media-ci/-/work_items/126)

----------------------------------------------------------------
David Carlier (5):
      media: mali-c55: fix dropped last AEC histogram zone weight
      media: mali-c55: Fix AEXP IHIST disable bit shift
      media: mali-c55: Fix scaler factor overflow for large crop sizes
      media: mali-c55: Drop redundant mutex_destroy in capture register error path
      media: mali-c55: Fix clock leak on reset deassert failure

Jacopo Mondi (2):
      media: mali-c55: Add support for CCM
      media: mali-c55: Add support for RGB Gamma

 .../media/platform/arm/mali-c55/mali-c55-capture.c |   4 +-
 .../media/platform/arm/mali-c55/mali-c55-core.c    |   2 +
 .../media/platform/arm/mali-c55/mali-c55-params.c  | 128 +++++++++++++++++++++
 .../platform/arm/mali-c55/mali-c55-registers.h     |  15 ++-
 .../media/platform/arm/mali-c55/mali-c55-resizer.c |   2 +-
 include/uapi/linux/media/arm/mali-c55-config.h     |  86 +++++++++++++-
 6 files changed, 227 insertions(+), 10 deletions(-)
