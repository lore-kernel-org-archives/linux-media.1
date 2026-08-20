Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43177415F14
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 10:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787222863; cv=none; b=hEW1p8O7apEin/hvaDyA6V/PIyZcExmnm1wHn4jNXgpqSm46Wt7XDJm9L5OfLXpatazm1C+CHl/O3Cp4GkgzH72ApAaFMOvh9z3rH9g3jryqHv8VEf+h5oEgimBNGvp76OFwGdVvokwbh6Gt1de4b451/Ki9RJCqpDCq33cYgKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787222863; c=relaxed/simple;
	bh=nzQKr2q9+PQ1qfsWWoEmw4mc5Wl9zV1gGZ1oZjxGzbI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tjzOxvBVo18p7BVOUlMutRvnbB6Oed0dhhnGhwRAx2/ucUE9misknassDj6626pmj58jKE3ph9I05X2GtSb9DwAd0UqAivfDRDEFfWw+jlzE8jo2ZfvqD0uSejJw7zq/P2t7d+7k+HqZAJWI3t7LICC7FYg2Jfw8UOCVa8chwlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=runtimeverification.com; spf=pass smtp.mailfrom=runtimeverification.com; dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b=KPZnpMBy; arc=none smtp.client-ip=185.70.43.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b="KPZnpMBy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=runtimeverification.com; s=protonmail; t=1787222855; x=1787482055;
	bh=z6pgZcXMItMel+deav3ZSwG0oHk6ofQYlX9jbU6ELXo=;
	h=From:To:Cc:Subject:Date:Message-Id:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=KPZnpMByqZxuqGE3hk1+BE7Hudkn5GfB/1lhTQ5Vthd6j9GCu4od1/qDhxsFp3fyJ
	 IV+aZPMHB8+lRKt5Xp1uOTxTBxL2OiCGz3Wi1MziwR1dQnXF/WyNODip4VRPvmVquW
	 KUI7WiRqwlJZw7Yz2RIt/UOJMCtcKIF6zUbWVat2Q1T29kTmgtjh2d7ZEt4JV/w0yf
	 u32hV3AbrlAHldAaya2L7f5kpNnoIC3IxQVmsuA1EW371ALkbDnBGnpSVHyvd6SPy1
	 FXdGp8DZQRQ5GKl5SJAD/6yHDOGDqC0F190fGlXMvbI/BZIrsiMXG3bY8UL9JhwLtP
	 0hRHpDN0iFFEQ==
X-Pm-Submission-Id: 4hQgBC6YMQz1DDLh
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
Subject: [PATCH v2 0/3] media: uvcvideo: harden the frame buffer size computation
Date: Thu, 20 Aug 2026 13:47:21 +0300
Message-Id: <20260820104724.191119-1-natalie.klaus@runtimeverification.com>
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

Build tested on x86_64 only, no hardware and no UVC gadget.

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

