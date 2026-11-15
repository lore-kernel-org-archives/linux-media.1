Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794749880;
	b=X0sfjq70Ix7rdCCbzG08ZVvF/Yrfymft5/3atgA4Colq1NKuKZXUAM9D/zDjIRC5hNEQ
	 yEuS++Br+V6SYOgcXQdUEl8zrjind0prv8Rkys2W+/UTx3dK74IwX3nc59qfWcqnD/kWt
	 PlH4HSWqI4NjieGZ5QVZO64xbp9w+qzonDJh84/jcTrnxPN/sN+3Egg9EtoZu2ZS2ZDGZ
	 LQSaGZb+e/bOGNFqQAhnjVi0aU8JWkzBhsu+ZhkVEytFChI25YptZw/MARJRGpWrZhuw1
	 GodgL7c0rYn44c8Rre+SmfYiWsdoEzrUPG//0LfeBi1BvN0aQbMK0rD+qjKbvFCJ7rg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=I90gEB0wXViVEQKBJGc0k65wJxE2LARqA1Y1G7+3VwI=;
	b=hNmTkuvb21YTUYuTa1kQ9vkcSFJCOyVY/ttgQFGXxr7Whk6O2xxc446sHt405QY/PMf7
	 MwcBkRQyL6dGXNANvj4BUZUvnaZN/30pfVJ4A295R0FDENvmJkUvD01zVSZoxPnbFXHcn
	 OVvT2Wan6S8OV//cWT6uP/Yr7htx5diETbVDGG2+c63Jijs05ONY34U+xaxkYOPf54EuC
	 wq1mY0OmNM76ev+aVHIqcHAVefnaJkMnNsZQQIxsK0gKSyVGlO2VY8q9HwYI97CfIE/id
	 sR1BUMVcNHM1snuVb4BAiLgDJDu9ewnRoMNCaj+gVXrj4sEo9J1R3KbcExOosp8k7nA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j5u+8Tgm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0810606A31D
	for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 13:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0810606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j5u+8Tgm
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67db3a48dc6so231157d50.3
        for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 05:37:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794749879; cv=none;
        d=google.com; s=arc-20260327;
        b=DKC2GgCALktoEtePzRtLXhmxUPqqT9JCmvlNTmHSbu7PM9AcK8IBZhsumiP7oyNaBB
         XuPlJOQqQaq1ntUmyffzf4o90Y+BOAAa0EVmhx3IEV448sNeR9Rn2b+fXUo8XScTBM9t
         Y2Lr2Gn9ElHYoE8GM6VWF/gDzKtVgHI98iiwQyURutywY7LlcStDB3v6RHqjOjVIskP+
         Zj2aiJab019d+3LxileuQwlJfkjyYoTMEBstJwbdefrDbmoLmEIVxtf/jd7h60JXp1KP
         R58MtNqDORMeSMKgRdRyHXdp4K57yHqe29VSdIoFB8CBe8wOGWkhYwMqbb4PMZOh/iMy
         2vHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I90gEB0wXViVEQKBJGc0k65wJxE2LARqA1Y1G7+3VwI=;
        fh=RfGEOwDVmLcrl+UIMOuP9Z6jT0y33U6aIKlxgQGIiAI=;
        b=eyRxP40PfqZW6ztZFwUQ9VcfzZtRbBjOmDv7gfu/p38bWuRZEBpsctOxsOn4yQy7OL
         sf6To4uKEkU5gRQx1UTWQyGtX+xhX1lrug1lE9ujYzzEJKkVQ4KUAk1UzLPZEpQSaTd5
         P52iHKdMH9bwzb2t6qzToFArOBdz6G/GAAihKT19x0b4bBfRW4eOsQfouT1Zzt5x8bDG
         wqtKI2rn5Fx6dLi1qY44n4hpUjP/Xs6T45cMLOS32lxkeMYLYuc9hv1uLn7P+aH3KmPe
         +qMeOc5iG6+q+EwvG4L7EF+4ZjNYlFKGEnVmQrtFpjWxR7Ppy0pKa3jQtRF7ur9/MHoV
         EF9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794749879; x=1795354679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I90gEB0wXViVEQKBJGc0k65wJxE2LARqA1Y1G7+3VwI=;
        b=j5u+8TgmwHXiKKpsbR7Szs8SaLfIfbPRiyJwZ9+fEjUNNPJnUNa3XTCzXk/DYH0khU
         MLrDmKFRDHsbW4ecqBlbueP9cdY0r7aeF9Izq4t/GRv2HaU+xmYVWTvm28qdLEUHKfgd
         UBBrE1o96MbOr+O5Iu/aTPO/eYHtuDDQ4nE9i3WFmBa4irbluZP24pQe8ShbtgoUBlCF
         lP/Fl6ltI8SvqfqC4KsJdfI/dj2TZ/0mBFdB2E4u/oJtZeljqE5e8D1vBQKXw+Bpms1g
         ZxvEL66v49EBTCXJR72ww1e/xcxIaXRxmQzHfwKMLUGoHwPjN5CejaUXjB0Ez3yMRvlP
         5msQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794749879; x=1795354679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I90gEB0wXViVEQKBJGc0k65wJxE2LARqA1Y1G7+3VwI=;
        b=T9bsZ4dltmQkZDt5wABxOkKeCGE+d8IDCLK6LlgC09HDZQX9i3KfkJp/ZSuKV3aQW2
         ScdbHBvERtZr9ZaMTL7xK6u0eMRjwCmI4Z/7yGvJFP6pKBI2n3ieo+NNetXb6DrW67Gz
         HeShVBz11qLZYizsT3HkGeuM7uZ3zNFVV4FUXRvOgRnQQZZ6nOhBsvQxUjxtwdMcPsLq
         hzhNNOq2S7OA9mWArD54NPAT1e7RSlKbLXhJA5kE1gNxfWU23h7tdkTzmX1B34YPhevC
         e89+KHjHJOVzJCRqLrR09h0qw8Biu+CHE/5r+FAkthUtDYYkk/pwJ/Ia9j/cI2qPXmiG
         3OSA==
X-Gm-Message-State: APuU4Z/LPG9jH5R01tVwrH2ez239BIc0q8WvEH4tgYnxY6L5Ffp0G/qH
	OsgfoOC08s53O82yuTE2+TsHMRiIJQRfdyP7rkSJNKrBwWW0WQP4LstTcvsMO+HSEmmWdhpsJNx
	ssQG9GdarvTX5ZgHQVUgxB5vArSOe1bA=
X-Gm-Gg: AYBFou2bQCmWVMoc8dJYC76hYVjbjqJcqK8DApf3imLy0pC5YzLTKcQKh9Dg1vwE26X
	kOk8sOLHe2f306fkFTYNpxVEf3cvYEyRUmwd3E3YkwsFdGHxHbYMNZf+x5SVtM94+wSje56uOr/
	e+omuUFYaJIm1ByKxFJlz/IFkQazL2W0bCG8Q0L20W5iB7b4qJ2bNYTEYWOf5UV7ynv/xaonq0l
	Lms4HNxogUaBKZ6kv23MBBL1wh8ZCFNqTQ5GVzzaFeMOZq+SY2yHNjENwXN4a7KsMZ9fJVtAPUn
	e/Dg94LxxPlm/BfcApfN04pjOMIERbZQCJXwIXpW+BmHqf+bw5Ny4izAUp+GlAijR+7SJgTOXE4
	sjHNO+IX9/5mFxnLCgcO+lysqjLF1z0+dHmia9g4r4kZD/PEwjCg68cMzhQIvTtOE/SjvtMFk5a
	kjI29Cht2DvPn0gjnDv+Sy9SrUSpzAvWqAKFq2eKg5ZuxfciJjNRC7TNn7gvqBa0njh46M7lY/D
	Pt5oYllJiQj
X-Received: by 2002:a05:690e:190c:b0:67c:3a93:638b with SMTP id
 956f58d0204a3-67d893e2324mr4461724d50.12.1794749878698; Sun, 15 Nov 2026
 05:37:58 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102141439.13505-1-kartikey406@gmail.com> <20261102141439.13505-2-kartikey406@gmail.com>
In-Reply-To: <20261102141439.13505-2-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sun, 15 Nov 2026 19:07:46 +0530
X-Gm-Features: AclHuK9aacDMZDOlVUzvL63WXYgaGKeLzw5nDq0_SsaPm0rMWGu8Dy2tKKW2KeE
Message-ID: <CADhLXY4DPmT8Q7Pw8b22gqwMha+RPdy-Gt17aqoeOc8OrxeVcA@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: em28xx: clear dev->v4l2 on v4l2 init failure
To: mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	laurent.pinchart@ideasonboard.com, hverkuil@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+54648a6c1187a7ef46a6@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 7:45=E2=80=AFPM Deepanshu Kartikey <kartikey406@gmai=
l.com> wrote:
>
> If em28xx_v4l2_init() fails after registering the video devices (for
> example in v4l2_mc_create_media_graph()), the unregister_dev error path
> drops the initial v4l2_device reference but leaves dev->v4l2 set.
>
> If userspace still holds an open file handle to a video node, the
> structure stays alive. On USB disconnect, em28xx_v4l2_fini() sees the
> non-NULL dev->v4l2 and drops the initial reference a second time. The
> refcount underflows, em28xx_free_v4l2() frees struct em28xx_v4l2, and
> the later close() makes v4l2_device_release() touch a media entity in
> freed memory:
>
>   BUG: KASAN: slab-use-after-free in dev_dbg_obj+0x630/0x830
>   Read of size 4 at addr ffff888023601bd0 by task v4l_id/6384
>
> Clear dev->v4l2 in the error path after dropping the initial reference,
> so that em28xx_v4l2_fini() returns early and does not put it again.
>
> Fixes: 288254383674 ("media: em28xx: use v4l2_device release callback")
> Reported-by: syzbot+54648a6c1187a7ef46a6@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D54648a6c1187a7ef46a6
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>  drivers/media/usb/em28xx/em28xx-video.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/=
em28xx/em28xx-video.c
> index 84424284d486..ec4ed2b0e5fd 100644
> --- a/drivers/media/usb/em28xx/em28xx-video.c
> +++ b/drivers/media/usb/em28xx/em28xx-video.c
> @@ -3137,6 +3137,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
>          * v4l2_device refcount to zero.
>          */
>         v4l2_device_put(&v4l2->v4l2_dev);
> +       dev->v4l2 =3D NULL;
>         return ret;
>  }
>
> --
> 2.43.0
>

Gentle Reminder, Please let me know the status of this patch.

Thanks

Deepanshu
