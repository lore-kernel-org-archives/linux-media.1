Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F514E0B71
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 14:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606101; cv=none; b=XugAO/TMn8JpMAE4j/QrhEzV9AcGfKAqfT80Ur7Esv2h2g+bcG5CqUmFNuN6+MSvT95TyQKUCXkR2EXF4u+KmqqwoJMf2v9RtliE/WF5mbEosG2NFjMnM/6gMRtdIu1h5uuMobMBlqWI4Wcs0/+mRJ+lwOUInghjZXTH9zOPTj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606101; c=relaxed/simple;
	bh=xwRf/YXfVKDuWSpn9uR+n9HGgUi+CPlHNq/+qn2X6+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=avOiN8oVOOwDVr6YFLKjHNRl6+SDMfRFmvlyCGuabU1+Wxmni5QG+D0IE8qGOtwLEIw3zrG7n28gzs5Ub6RdyNuND3rXIut/0elZ/ugl8nv9hHx1uodTiIdR+xc3z6Irl0WuqPQ305hKtPxFxkLSRMSUKMqwDAruXTaTh5QLNQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gl8WzAE4; arc=none smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gl8WzAE4"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-85d43ac8d1eso26428287b3.2
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 07:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790606086; x=1791210886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XZsYlJKTGpvGATz0Om2YNQHbE5WZRaO8o4xFsELbjv4=;
        b=gl8WzAE4U1BtALlyiu4ANErV/JJEInLYTLwNnEc5RKxaHejnH9fW3eIXtptYsWLSB9
         Ug1KTzi1DFSIQTc/twAA7x2PAAFS2floriXOKstAlkvooo59mMZTgUa5cQWbnjgg3lF0
         T2nMhVT6TZfusojQ2gQf0HkHHs0stzqyLRqIfyM3JLBouUYV2XaJKbl3DQjL5atUKWeO
         NhPe0QdLE+GmWmRfMf6urgakZCZnGGAjnGcHlNFT9JVNX0+aR95sifItl1M2wLdywwXs
         A3Pph7+r4QlyLxcgwhcN0MtSRCRZoRf36z1z2o6sacnxnisikCfLcFbNS04TxpcwcO+m
         fmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606086; x=1791210886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XZsYlJKTGpvGATz0Om2YNQHbE5WZRaO8o4xFsELbjv4=;
        b=JVPBOVMdNCY4hK56mYW5427WI2/wu/2l0VTIr9zpYjDp8rZEMyYlXZfwt9GM6wgmZg
         xW35PHl3fiZJRVqRLB9iQQDVY4ZsAn7QlIs+zeq4E9U0W974lgyG/AuDPOuqLrHqlpbo
         M1g7yooGi9mNVdnhINTZT75ElrVHpBVYv8tve/LZ5gaLxAsgINHk8oSaTiOcs2hQOZRw
         MlbVm3KUCT1421FbF+7nWgd6EKfN6dCgtLQGAj0EnSMLKH3VVfHNxMvvqKgJ8XQ6c6TS
         FR9/Y7EDDBZLlalZK9IjsByLFgEGJywEqJARFyZrbw8+3r0xNPUDzpzJmQ/mdx4W+6bo
         yoXw==
X-Forwarded-Encrypted: i=1; AKwUvBycbZHlOsRaaM7eq4Wudh3hCU3evXpfUn6vOWS9Yigim+CIyg2VkbfTFep4g3umoPH8OanSmysnH/Njiw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJjqx1Ywfgw7P6JH1qMS7dGQTEYJD/vyu3ACRe8BQklnOG2KgZx
	h+8JCgJUNYh6BbOXmunUI9bYjJPvX8lD9KkfpU9J1pkFacByrHyz4l4c
X-Gm-Gg: AYBFou2M+fv14ZwcMZkPCqegdJifdWvJnWYPmMz/dF3WdvG3fhc/zN2ivn0MnlgyoAe
	EsbR0GiNKIeMQpzF9k9v0lkHXEvHddKrhX5YREB1u8cGACMKw8yM7khm/FMeLIo6InIDFjAdzUo
	caBUktSiddn12TytGuf56o5AY1p71nTf+SHxgvThvxMuVIRidroHd2IXy4HApuydDAlUSYCnbcI
	qbTIQj2+mgzsDW9VauZiGHzayrgFjWGTL+cuyRPrK7RjYyU0WIEP6/tSqOEcqJQ8SMBQy98t0Bi
	mp0Xqs80VJ1VpCYLrCxnwB4cNAPV8FHYw8kZd7UgmNjVMtdnA6n/Tm2uH9eKeLVv1HyWW6rL1Ra
	So2pR3XBWho1qk73P9Nk1fjoXbFzLmeEiMmVugIe/+hx1k/ZySp89m9PK/DX0Wx0UsW0u7apGLz
	Lqor7fAifHZoiMxCRgJsIskHpeAa7y5qdXAZuM8N9ANxMgoIMyvz1n9d282YYiiN67kG2SSpz0J
	DZpE5jrraJ1fd9ZLFIUE0TOEnKZ58YRmxZ9uB/Pc8kZGlXVt5JOKw==
X-Received: by 2002:a05:690c:d:b0:891:c494:1a99 with SMTP id 00721157ae682-8a649978855mr63166317b3.24.1790606086291;
        Mon, 28 Sep 2026 07:34:46 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860f8544fsm45489817b3.18.2026.09.28.07.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:34:45 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Michael Jordan <jordan.mymail@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] media: uvcvideo: generalise the XU flags fixup to all controls
Date: Mon, 28 Sep 2026 10:34:44 -0400
Message-ID: <20260928143444.757654-1-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928114423.GB157191@killaraus.ideasonboard.com>
References: <20260902002553.34839-1-jordan.mymail@gmail.com> <20260902002553.34839-3-jordan.mymail@gmail.com> <20260928114423.GB157191@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Laurent,

On Mon, 28 Sep 2026 14:44:23 +0300, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> That's a long commit message for such a simple change. Is it
> LLM-generated ? If so, you need an Assisted-by tag on this patch series.

Yes, the series was written with the help of an LLM (Claude Fable 5).
I will add

  Assisted-by: Claude:claude-fable-5

to all three patches and cut this commit message down to what the
change needs. Apologies for the verbosity.

> The code change looks fine.

Thanks.

Michael
