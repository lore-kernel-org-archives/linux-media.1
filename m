Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D459644C670
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 16:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786983575; cv=pass; b=rEKXFMsRsX7I7+OndWc7uWXnghoLgtweIDvnvG4xmCjyrocJdNk/EVC0PEvqkFwdDUeMXLhRrm37G0sDJo6eyhE4toqrcbizIwUYDxXadknGV3UBvDUKaOndwufZwtoS7j1DdW6z9GCswutFrnlzk7MBWkBXVwq8H/iunC9bunY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786983575; c=relaxed/simple;
	bh=ok9b/hGgMHy0RvQBlUb/jv2F/avpSyhfO7YHzTf9RfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SjCzEx47kyG5AgXoGJmfnH2nrFg4XZ6B8ABEl7Tqz53DdNik0nH4x/eeorAHiOtzHkJc9X/TJz/zxivaorusC1bWK8jxrNKzDu0ZeogUpijGs23omWk+VTypX7CX8aB2Vo0RaBK5VXVKwI2VUwaVO+OiZGv6lGFXdxZu7isIj0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JPf5m405; arc=pass smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPf5m405"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7eb787dec99so2350447a34.0
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 09:19:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786983570; cv=none;
        d=google.com; s=arc-20260327;
        b=fPz2oFK+SQyvHjURQi04p0BelSPsKAe/7EXhdHKriBs7l/CKBvZtujA+3b3PGd15Q2
         ayefZdVWbfZiLYUvP2Mqx90b+QJpntuibjaLI173zM0YZ93niIy9vbjwgaCsNRSTQIib
         v3DkzVHMflZ5CsF0L5mFhbEEDw+c7gd1K/aYtXggXYd5J0PB+rPHAVdULnlMRCgpcm9s
         medZNbr3CbthTLrpN/4BhuuG0Gm1dC4M/awVMsbAH+QETbx0VXgAeUUTI10GLzGN0NVS
         X5ydGe9+4mYoFhoaTe+HgpWMaLyn+NVV+pwnboVkGaLb6mNgDM1O9BHJsTpCVYy9rS+x
         PejQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ok9b/hGgMHy0RvQBlUb/jv2F/avpSyhfO7YHzTf9RfE=;
        fh=zgmXkoYfbTFkJK6Vv46wdBZ6U9m2Hi6M4jBn86Z4kY0=;
        b=GtjcOGO4CPGUNY6vdVqcKeDypSOnzmcLjoV6CQEi0tqm7WOio41CaWKtAtFj6+4oTY
         TLu5J1L7N+vTIY82PGllZ/ytOX7BV2vQOID/os7UBc2iLzc+vKSGYKYoUdoDpnTs0R3E
         FeD1jaa8cMySz/bRz5qVwkLHwc2WwxdGnQsCFyWizeps/zWCA8QQPuknQdO+4Sx1nkD2
         CeaPqNEnbGhuuJTpViVz8ZGdAXY8eGGJc9SMmCeHQJnlbswt9RH50DbScvhGWhy9xPee
         91YiajVEJOzpUyd5a9EetCW0PYPTm5YKOHmlSaLjcgVEY4rKJOIbwEaTf0yz6rQ7VdWy
         aIAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786983570; x=1787588370; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ok9b/hGgMHy0RvQBlUb/jv2F/avpSyhfO7YHzTf9RfE=;
        b=JPf5m405qPvZwR2e3ujJvHhR2vqCU4opbuw1B7H7DhzYIgSjZs7yC4TP7s2Ujm/K8K
         rEKXzV5fo5Zw/goVj7ZrJKiumFXdTZPszwF+GdgNTX4SdjPHpHS6nz1J/MDUCZU1g10e
         svl0D1KT36pKyfakNXY/lfCRXxow5cIJwCSE6xPxFa9Wjdw27hLNxJCFGtK/lo6GsDEP
         PXR7hdMQbNudyzzPV1K0jOB4flHjNDZ+PXOi1cEZ6dtkvXZD2WEeL4QegMZnqg6cu+5Q
         kjGhwlN5/FoFWxvkBLw3KuuNsDahkMldxyQJt6gb2/3u/yC3B+gYq1gaTh9sP7934scg
         yBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786983570; x=1787588370;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ok9b/hGgMHy0RvQBlUb/jv2F/avpSyhfO7YHzTf9RfE=;
        b=GCSRabHEoheq8KBRavEER9RN91scV8pfz1oX3B4n6lrIEJNCUR4xc7uwqCvS+7Mqb0
         1GGt0kTBnrcxiZdYFoU4Gk22NFUOyokG0EAoH8yrWXJTcBy0IZstPkxEL8AcmGJmL2Jv
         HrHkNxgpODJn2U/QN8AyP2g0rl6CIq+0OTRMKQ5CWAKK5C8lzVc51Jm0c2JY9o288F8Y
         AdahpOgycxLfAdL4wWFNhsPtzYX1/6dMLM/DxXvMeL4rlHEBwNQkL+oM6OGPYuZUTyjX
         G+Yywg27+nHsGvvTEu6VjnKddQ3FE6p0aji8lpj1XVytEkZk9PTH530AAM88mOYJssiI
         pPPw==
X-Forwarded-Encrypted: i=1; AHgh+RqxJM3ao44S8sVXSKHweydQEh0FwMpqgJK0dZJWlJh2OMefV5Vf0x1BCps14CwhKKH7tXJjSs0MTIMKEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzVJUTMBhmRG8u8wVwxhOXYPoMcQ041JCbB3LftzqV0CPlWuTh
	E9VSWWCOimznZPI+oU7XUds05AbAvntOixEatzFzkHZ2wPlx91U7mdBjfqxLYhfrV/6wgtxvDqA
	qXnSH4yXFXUw2WJbZ2uV+ttEL5XI6F24=
X-Gm-Gg: AR+sD13azOdGFzE1vtpEf8QXvkjpI1nThD2wKGXBtjmchYkoVoIKd5eBg/SHTJ+tfry
	txNEPff2u4HnwI/8z5ROVC3rN01OSJqKCsWr2KgrfVQlOpf2uX6eOktafsf2kBFjrpO8hvCvCAO
	tKeFVAoCYF6lqtb1UBV8474JNTFaTSFgGu28sjfXqQ/mi3vAU83SPcPgefqP1pmt+T28PTyUC59
	7YUII8puB3fq6n//VS3Dd2kfs8aFDMpUNzi83C8mv1hpsZ4yO3VxlJfjeXXTMR3r4SHF7neCUh7
	wl5uuEZ4xFovdKz2CdxqT9JA33pTcAKrSs8HpwkVGQfQCk7cxSXhHH1pkugPOsFdxJFUODNBsxk
	=
X-Received: by 2002:a05:6830:2708:b0:7e9:cad9:4bc4 with SMTP id
 46e09a7af769-7f3de64c4e5mr26475112a34.7.1786983570237; Mon, 17 Aug 2026
 09:19:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260815193839.141406-1-devnexen@gmail.com> <aoLZ5e0ffVvZ-FfB@zed>
 <CA+XhMqxR+m7Jt0UUHetCfXSHHtW5w-jUc0_PSSWjTbprYn8ZwQ@mail.gmail.com> <aoMuMvE0zJG1MYD2@zed>
In-Reply-To: <aoMuMvE0zJG1MYD2@zed>
From: David CARLIER <devnexen@gmail.com>
Date: Mon, 17 Aug 2026 17:19:18 +0100
X-Gm-Features: AcwNN1WZtk7Zm16KusB7eA5zYDAAIyL9cuvp343NEcRNeo5rJN7TigkzkaaAfMw
Message-ID: <CA+XhMqxY3u5YR06j8jX2+wCwX95vQrb5EVH39GvuJXrwA48XWw@mail.gmail.com>
Subject: Re: [PATCH] media: v4l2-isp: reject zero-sized parameter blocks
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Michael Riesch <michael.riesch@collabora.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, stable@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 17, 2026 at 05:56:30PM +0200, Jacopo Mondi wrote:
> Should we instead deman that all entries provided by the driver are
> populated by failing validation if info->size == 0 ?

Good idea, and I'd rather keep both in v2 if you don't mind - they
guard different things.

info->size == 0 is about the driver table, and it lets us answer
"this driver doesn't handle that type" rather than carrying on with
an empty entry and a NULL block_validate.

block->size < sizeof(*block) is about the buffer coming from
userspace: a block's size includes its header, so anything smaller is
malformed no matter what the table says, and it keeps the loop moving
without depending on the table at all.

Both are a couple of lines, so dropping either one is no trouble if
you prefer.

> Right.. you might have seen ?
> https://patchwork.linuxtv.org/project/linux-media/list/?series=29170

I hadn't, thanks. That takes care of the rppx1 side, so there's
nothing left for me to send there and I'll stick to the core change.

I'll reword the commit message so it doesn't lean on rppx1, and keep
Cc: stable unless you disagree.

Cheers.
