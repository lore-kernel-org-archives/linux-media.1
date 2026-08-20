Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9195A1F5821
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 09:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787219811; cv=none; b=TgzqnDxGMBLjJfuoh22PvzwvbGr77gcOXCayLrnH62zAyBi2xZIRoQqq++90qt4f5y+ATha+10BfUVFMuG9QGH95DJRd/TL2kE7j7bYkujkdrIQO7JQeZ/w6HPRK5TiwgV5N/+5j5QpVRwPNRRy2aPctuJYw18ajfFroXYDhSSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787219811; c=relaxed/simple;
	bh=d7YiDpkx+zWx9LE/7WC/MdfvOV9WzevPPTg+xTgl2Iw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=X4VfQYJgVUQojslNW8UkTf6RYCRH8wTNdTsXW8qm+7MKM8S25EabbDJBgF8tr5ZaksIUPgoNA2usT7uYxH9o7tmKmbcpkA5k56NLVD2pIZ4yzXe2DApjXnij0R/y+QfwZ7fZlHRuLDGznSpwZ+JMiFJVVP6BRnOdZkMlieseoDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=runtimeverification.com; spf=pass smtp.mailfrom=runtimeverification.com; dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b=F/H45qeo; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b="F/H45qeo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=runtimeverification.com; s=protonmail; t=1787219800; x=1787479000;
	bh=mq2jsz6yPT2LjR3gl8sjZakPMAQxOXP3T5qRYGzs52A=;
	h=From:To:Cc:Subject:Date:Message-Id:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=F/H45qeoyKPCFAedfIi5pKNxFbPDLZID67DHw6A/UYaTOOtTUCT+2PUUHpczmnhbu
	 xqS6D3E0MtuFM5VsKw4EL3eZFVNSyt6RzpF/yiW9s6h3INBjnU931ZXQvM0n74y8A2
	 Sv+GJ0xe1JFmbJqqX84kcEg2HaGWJ1AFo+s7nmc/1vDDnxq0ty4KY3aKKLORBFVLTq
	 XJqqxLNBrIbrdqD5RJISX3oAvqIqXbkupmA++bviCH0DvzaTLDq3O3W6HhBLHC4zif
	 ldJMAjiJUKTTgdKnUtxvAWLJ/sVJw86Ad3rrbJP43vBdXJ0jA6X6rxpYWr6TYTTvRv
	 fB9zFbE3ggjyA==
X-Pm-Submission-Id: 4hQf3Q4fbSz2Sccw
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
Subject: [PATCH 0/3] media: uvcvideo: harden the frame buffer size computation
Date: Thu, 20 Aug 2026 12:56:23 +0300
Message-Id: <20260820095626.111196-1-natalie.klaus@runtimeverification.com>
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
       DIV_ROUND_UP and the operand values in the diagnostic per David
       Laight's review.
  3/3  the zero-size case.

On stable: 1/3 carries Cc: stable with no Fixes: tag of its own. It is a
prerequisite, since 2/3 and 3/3 need -EINVAL to mean "skip". Backporting
2/3 without 1/3 is not broken, it reverts to discarding the streaming
interface, but the commit message would then describe something the
backport does not do. Both or neither, please.

Carrying 2/3 on Noam's behalf, with his agreement on the list.

Build tested on x86_64 only, no hardware and no UVC gadget.

Natasha Klaus (2):
  media: uvcvideo: Let uvc_parse_frame() report a skipped frame
  media: uvcvideo: Skip frame descriptors with a zero computed size

Noam Ben Shimon (1):
  media: uvcvideo: Fix integer overflow in frame buffer size calculation

 drivers/media/usb/uvc/uvc_driver.c | 52 ++++++++++++++++++++++--------
 1 file changed, 39 insertions(+), 13 deletions(-)

-- 
2.34.1

