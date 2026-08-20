Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E1241BA8B;
	Thu, 20 Aug 2026 11:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787224576; cv=none; b=c7/I4HApArTl+F2QiLfyNMFrHY86Y4jDkeDHFP9hHASt4cjFNhHcZ9EIBfsQBLK0OiS/UyKL/piERkbv7x46ihNNEy00WPsst7nNJ+NnhQIFiNeNeVRu6X6pwN2fNYJZhG0CfR87XejGI1zDWNmLkBcOQ/7dJHwu+ZDwg7Ts3TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787224576; c=relaxed/simple;
	bh=WwQAa3aP0JRCyunLRVOnVCeztQ4F8dLkqwxznl+j/gU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Js/38dICkCy6DhzD71izDm0h5Sgnfw7YNC9dfx1RXDj43uoj048h7mqusIwHLVPVGaWG6gHxME19NUuKSGRtWZObsGgEF7yMCvqmuzEnJTLd8DRFjVnauS/M+5UNnudXODoXFer+N5tVAcdgfy4UXW3YOCbvbFSq8yPUjdY3kI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=runtimeverification.com; spf=pass smtp.mailfrom=runtimeverification.com; dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b=fp/mlevo; arc=none smtp.client-ip=109.224.244.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b="fp/mlevo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=runtimeverification.com; s=protonmail; t=1787224569; x=1787483769;
	bh=YDdyvui80lIkgnU+16NJ70lahm7Gu8B11DPxXytSQso=;
	h=From:To:Cc:Subject:Date:Message-Id:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=fp/mlevoKBOBRFY9Kgq7d3trX3WJPolmNuHYnnO7vhE54jTZmlREcxeAdbg4gAsr6
	 ZCEjas9UZRmyBsVwpugrgd24m/7/G3agSz30wZv3QUd8s4kNvu3tnP2YtLzujx0AC9
	 l52BvfL6YoUoxuvNplFXKaV7I3Bk58RPSV/t52CSv7a++dvD9TpbrkUoAzp0vvYyAm
	 XVSMY9fp49RsgaZA7Ktal5/L3y3gBLkQ0Djc2SmosjFEz464qFlVebvDqZkr16NB2F
	 o9XQZyl0dFpMpsx/45QltzNmqvLoM7qdz3x5axDX2iWcTMg7mwD2Xi12WwiiFBSsqG
	 IgDSeb05tGx6Q==
X-Pm-Submission-Id: 4hQgq9239qz2SchM
From: Natasha Klaus <natalie.klaus@runtimeverification.com>
To: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org
Cc: ribalda@chromium.org,
	noambs2999@gmail.com,
	david.laight.linux@gmail.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Natasha Klaus <natalie.klaus@runtimeverification.com>
Subject: [PATCH v3 0/3] media: uvcvideo: harden the frame buffer size computation
Date: Thu, 20 Aug 2026 14:15:53 +0300
Message-Id: <20260820111556.232652-1-natalie.klaus@runtimeverification.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uvc_parse_frame() recomputes dwMaxVideoFrameBufferSize for uncompressed
formats from three descriptor fields that nothing validates. The product
is evaluated in 32-bit signed arithmetic, so it wraps, and the driver
stores a size that is usually far too small and sometimes exactly zero.

Noam Ben Shimon reported and fixed the overflow. Reviewing it surfaced a
second route to a zero size, and Ricardo Ribalda asked for a series
rather than two independent patches, so the two cases are not handled
inconsistently.

  1/3  changes the return convention of uvc_parse_frame() so it can
       report "skip this frame descriptor" separately from a fatal
       error. Suggested by Ricardo.
  2/3  Noam's overflow check, adapted to skip rather than reject, with
       DIV_ROUND_UP_ULL and the operand values in the diagnostic per David
       Laight's review.
  3/3  the zero-size case.

On stable: 1/3 carries Cc: stable with no Fixes: tag of its own. It is a
prerequisite, since 2/3 and 3/3 need -EINVAL to mean "skip". Backporting
2/3 without 1/3 is not broken, it reverts to discarding the streaming
interface, but the commit message would then describe something the
backport does not do. Both or neither, please.

Carrying 2/3 on Noam's behalf, with his agreement on the list.

Tested by Noam on a UVC gadget over dummy_hcd: a format with an
over-U32_MAX frame, a zero-size frame and a valid one, where both bad
frames are skipped and parsing continues to the good one. The -ENODATA
truncated-descriptor path and 32-bit code generation are not covered.

Changes in v3:
- Tested-by from Noam Ben Shimon added to all three

Changes in v2:
- 1/3: check -ENODATA before counting the frame (Ricardo Ribalda)
- 2/3: DIV_ROUND_UP -> DIV_ROUND_UP_ULL (Ricardo Ribalda)
- Reviewed-by from Ricardo Ribalda added to all three

Natasha Klaus (2):
  media: uvcvideo: Let uvc_parse_frame() report a skipped frame
  media: uvcvideo: Skip frame descriptors with a zero computed size

Noam Ben Shimon (1):
  media: uvcvideo: Fix integer overflow in frame buffer size calculation

 drivers/media/usb/uvc/uvc_driver.c | 52 ++++++++++++++++++++++--------
 1 file changed, 39 insertions(+), 13 deletions(-)

-- 
2.34.1

