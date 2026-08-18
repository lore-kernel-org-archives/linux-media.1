Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C14A3B2FF6
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 09:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787046028; cv=none; b=VMd8v6BCgY5KnyhtL0e9YLLSNnivkwlOTfN8PwJgmKUh8k2um/MDXM/uYi265Z2fz9l7EzEdQyxq4lFqXRUjvhNG16FJwsZ4GlliCxq8HwlAltFMbKAQmvSJYIP9+glryF+CYvu+eUoPWYDFoy8mQzB9O/BxSHHHzERVHLk8XEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787046028; c=relaxed/simple;
	bh=s1FztMOpIE1fIBns73mZvknBj+BIzdCEkbUtf9WpAeA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=us7Q9D4hMu+1yvYPSiUyiTTfT/wLtahTBDX6zl+FuGWn8x74NPUe1xO633LNf+KtLmeCz8+HbcJ3wwTbVvSYOlMQNg4Jlpcv6rV4NL3IQpDyu/jx2Z2OjdLWIf+AFOaJqecb5yLZ0s4LYE6YUKoT4ab3j/AA1KHdHKUF8BXQtko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=runtimeverification.com; spf=pass smtp.mailfrom=runtimeverification.com; dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b=qldhRD73; arc=none smtp.client-ip=79.135.106.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b="qldhRD73"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=runtimeverification.com; s=protonmail; t=1787046021; x=1787305221;
	bh=pSUn37LaDTsWdUlQ4uqYVHGnr7U+sC+7a5qEyl7HXkM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=qldhRD738nCkedLmuH50RQHAWR7NHazZ3dq2rRaAoKuki9BNQJir2ZkLL/VQpYmN5
	 4GqecLpPA9Xa9SEJGOBzNvviQRgF+rnVhBqn9GaMLF0QdGSvCKfm3qbMu3NqF5j/mW
	 sC7pZrd8Mppx5EsMbnHboCZiDASiZDkrJO80lbrq9XBU4bFv+Y+y5RfnWXGi0spbfj
	 raz9IBL93LlooV798O5Gee2PEYI7SICYzEkXD7tIMKOEWSQ7q8AP1mm2xMOzecMiq4
	 z+5389dAU4Hc0sjKRq9BHbzedz5Su5Np8f46uP8KyJib/JnDbE6mkF2Zrb+nb4qQ7H
	 5CWvThKso9ptg==
X-Pm-Submission-Id: 4hPPnZ3TjQz1DDLk
From: Natasha Klaus <natalie.klaus@runtimeverification.com>
To: ribalda@chromium.org,
	noambs2999@gmail.com
Cc: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Skip frame descriptors with a zero computed size
Date: Tue, 18 Aug 2026 12:40:10 +0300
Message-Id: <20260818094010.353021-1-natalie.klaus@runtimeverification.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CANiDSCue8yyiGubzbAybRqSUTTFuB=-Y2TZy6yvOx32SpAASWg@mail.gmail.com>
References: <CANiDSCue8yyiGubzbAybRqSUTTFuB=-Y2TZy6yvOx32SpAASWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Aug 18, 2026, Ricardo Ribalda wrote:
> I think we need to have some consistency. We cannot have  one
> condition returning -EINVAL and the other skipping it.

Agreed, and your shape is cleaner than mine.

> If Noam is okay with this, perhaps Natasha could prepare a patchset
> with the 3 patches? (keeping Noams author on his patch)

Happy to. Noam, are you okay with me carrying your patch in a series?

One question on placement before I write it. Your comment puts the checks after
the frame interval parsing, which is outside the !UVC_FMT_FLAG_COMPRESSED
branch. Frame based formats legitimately carry a zero
dwMaxVideoFrameBufferSize, set unconditionally at uvc_driver.c:265 because the
frame based frame descriptor has no such field, so a zero check there would skip
every frame of a conformant frame based device. Did you mean the checks stay
inside the branch with only the return value changing to -EINVAL, or outside
with an explicit frame based exemption?

I will test the refactor before sending.

The Media CI failure on my patch is the missing dependency on Noam's v2. The
series fixes that.

Natasha
