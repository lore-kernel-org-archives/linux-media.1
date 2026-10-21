Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792598445;
	b=pWX1hC9ia+T9Iw0hCQ2pE658zyFl1qkiCX2yoPmLBcuDF/Oy+n5ZIoOVbG0fItWaHC++
	 fpelhFJhdc9p+qyuD37Y6QLXNUAi7Xh9n7OfdHXU3obiUyZqBUH/VWE+Yfb+4f3eiJhHn
	 SVt4KioLysl4o3FUSXkksl9Q72FbdYhc/p/69xWz0mfF+f1yqPKJRm4/9lnu1uYQ+CN67
	 6RTKUQR84VrhAoEFwaRLwfLUxDdlFIC7K6uyoarnzu1P0fTwhLOeizoGDNgh4NdbzT2q7
	 3g5oLaBXQ+yBVRGm2Y4AoYsTyWoi5aozXboDrDUEPVXSUp+41MsS57nQp036mjCd5vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792598445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=5W0wO5ApY1ruwZkrfuprI8pGOadn8UJEcw8Q72azQTg=;
	b=p61CV8NydEAF0tuc0Hssq4/MNqbQOmUwBDRkAAXjbxwbxZqYRnGp624rAsLCk8MPmFee
	 myKyK0MdTsJH3skojYpytOqZvMWD2xOfNg+ablSnyZRLtFtoIscO0qkCDMnwsRm3iOFWV
	 gy+nsvS5ugtCAW0v1sMgs9wCkFqAhu4j71N+vzSoKYQE3GKksOqSYj4DjJdkqRAehjmPG
	 IrYj45Aa1aH3G9NoXxc3m6vGRLDnD1Jdd2XzZ0LqXSHotOEerCny0QWKxFNBHRWz7Uxmz
	 UnumcYL0d/G/YvE9R0QMszXktqt+XN6VYyo7hAD+IpNRFe5r4abYpmxCFsYBFGI58Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OeAd1g3Y;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDC5606A324
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 16:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CDC5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OeAd1g3Y
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c46822eefb6so96101266b.2
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 09:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792598443; x=1793203243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5W0wO5ApY1ruwZkrfuprI8pGOadn8UJEcw8Q72azQTg=;
        b=OeAd1g3YFCv/EKmc2FQAOFmBr5jDGpciYXGf/B19otUpgOqscTyzQNK4E8FeuKbjqM
         0fG0/b6lNsP5GIJrTyWgPiXTDXXV+4AIaeAcigsZJe4SlSYTvCN+l91oSxi6Wq8jgc9D
         EhsvHcMP6egTFJDSpZu8fLIkuB97VITWo4ufE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792598443; x=1793203243;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5W0wO5ApY1ruwZkrfuprI8pGOadn8UJEcw8Q72azQTg=;
        b=uNEszOxCaasx580ZDYDuYLS3UnckJYK6+izmAf1ELTwqag2eCrEmNiI5RKuj6/X/Qg
         QuEu2o7o/S0Jwr6ZCRR0Vva6YmhPkXiPnwnpomYyRJJ3ZpdsQTIXSgyro8K1UaSyppuC
         2eou6M26sDx+IpYMQg7fP0BfMi2YRlFIj5kpe4HvKB53wUAyUy6XaGe97TN2aUDMMn87
         aEP3bWuOaU245Jk/2YIpFn8sEqHdfOVL4T2CLzmgBMjKyyWwTL4iw/hFfzaaFaQ4vAwL
         wtmAlNLhLT8V9mSvoG46ISlfjMA8tjVX7dMWoq/TBVRkSbSOiH9FtSqU2kdofwKH7FOx
         H8Tg==
X-Gm-Message-State: AFq9FYIf5mszgi45OTx60/+DkEYvE9Qn7c+Ba0/YaZgvqHDi3bC1zNZj
	Im/iDdFjYvpk0AWiD5+T7Wcn0Jpf5n8qlTIZMa2+Erly34OzJAhBPSiLkL8xyuUySChYdQv4aS2
	cXeWDWz+K
X-Gm-Gg: AYBFou3Afn3X7rlmMnNwogI+9upsUkAHoUwKG6+JXEupBtefcl4CFg0n5kQI7T0lrqh
	TZIP8fueRumRZhkvENFqn+HIN2nGVry7AtCNRg44rpLC+xdPpcyb5l0SaQUWygsfAx60bns9cvS
	5bprMKu/z9oK3XogG//Pb+9YnEaaObBQwuPBIfqY52QBUSjWAbFUx3i0HdnixKqlj+hBXfGGhs5
	EWeM66KK3IdVEnGBxvyDPFiaHl7uta7Cdj9a7s4SBRmqVUSEX2adggTAqNGT4dMCJoGt6sv5t60
	y5Za9Zvp/QF6GaH6QsJG1BYU5J/BxYVHoEc5/Q1nVxhMt4ShxnV1rGon4c2ZWpqFnBgnqkkders
	RMi9j7ecAZSVhg7FkPfo2z4CAeCVavlmhf1o6FG+YsDlQYBmJurJy7s6KdGPF2M4nRvP9pBWFpo
	/EOSbp7DsPV56jPyaIzBvO5h3+v1NWr4RhMA8R8g6DB/34X8t0OX+5cQzngjxcb1G0mpOw+LjV2
	wv8YgA1FxMpfd42sfHKCvozGfU5Kr6J8AqznQ6VA65ebFZQM0+TpaR3oMxZDvi9ijIRl3VSIrSG
	YoUi/5Wh2BBvSsI=
X-Received: by 2002:a17:907:2d10:b0:c41:21ef:26ef with SMTP id a640c23a62f3a-c46796a197bmr222374266b.20.1792598443382;
        Wed, 21 Oct 2026 09:00:43 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5e205bsm15665566b.74.2026.10.21.09.00.38
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 09:00:38 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so11929a12.1
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 09:00:38 -0700 (PDT)
X-Received: by 2002:a05:6402:c181:b0:6b4:124b:da30 with SMTP id
 4fb4d7f45d1cf-6b4124bda8emr34019a12.12.1792598437038; Wed, 21 Oct 2026
 09:00:37 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792392288.git.kmehltretter@gmail.com> <f2258d73562e0ebf2efd793b646706ba0dacb2c7.1792392288.git.kmehltretter@gmail.com>
In-Reply-To: <f2258d73562e0ebf2efd793b646706ba0dacb2c7.1792392288.git.kmehltretter@gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 22 Oct 2026 01:00:19 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CDPG4RxUwPDbPUJSCxVZE1cEeYEZvQ25Sy4CuJR861Yg@mail.gmail.com>
X-Gm-Features: AclHuK9e58N_Im_zhkbxzzSKI3JdeU-CBpj5GNDyWEt5aL7nKqE3jFXgtXMdHNo
Message-ID: <CAAFQd5CDPG4RxUwPDbPUJSCxVZE1cEeYEZvQ25Sy4CuJR861Yg@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: videobuf2: finish prepared buffers in VIDIOC_REMOVE_BUFS
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: linux-media@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Hans de Goede <hansg@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Tomasz Stanislawski <t.stanislaws@samsung.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Karl,

On Mon, Oct 19, 2026 at 4:14=E2=80=AFPM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:
>
> VIDIOC_PREPARE_BUF leaves a buffer DEQUEUED after calling buf_prepare()
> and the prepare() memory operation. VIDIOC_REMOVE_BUFS accepts that state
> but frees the buffer without calling the matching finish operations.
>
> With VIDEO_ADV_DEBUG, vivid reports:
>
>   unbalanced counters for queue 000000009fa716f8, buffer 0:
>        buf_prepare: 1 buf_finish: 0
>        prepare: 1 finish: 0
>
> Finish prepared buffers before freeing them, as queue cancellation does.
>
> Fixes: a3293a85381e ("media: v4l2: Add REMOVE_BUFS ioctl")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  drivers/media/common/videobuf2/videobuf2-core.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Thanks for the patch. Please take a look at my comments inline.

>
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/me=
dia/common/videobuf2/videobuf2-core.c
> index b0a6084f17573..460eaf4e82f78 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -1746,6 +1746,19 @@ int vb2_core_remove_bufs(struct vb2_queue *q, unsi=
gned int start, unsigned int c
>                         goto unlock;
>                 }
>         }
> +
> +       /* A buffer can be prepared without being queued. Finish it first=
. */
> +       for (i =3D start; i < start + count; i++) {
> +               struct vb2_buffer *vb =3D vb2_get_buffer(q, i);
> +
> +               if (!vb->prepared)
> +                       continue;
> +
> +               __vb2_buf_mem_finish(vb);
> +               call_void_vb_qop(vb, buf_finish, vb);
> +               vb->prepared =3D 0;
> +       }
> +

__vb2_queue_cancel() does much more than that, especially all the
media request handling. In addition, this open coded handling just
causes code duplication.

Would it make more sense to refactor the relevant part of the buffer
cancelation loop from __vb2_queue_cancel() into a helper function and
call it here instead?

Best,
Tomasz

>         __vb2_queue_free(q, start, count);
>         dprintk(q, 2, "%u buffers removed\n", count);
>
> --
> 2.47.3
>
