Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C3B3F076D
	for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 17:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782494952; cv=none; b=I+Qlc19g20QSB88Sb5YvSwTauyeJxkJ7KJil6R0F+GLnuuz7WsEvJEW6H6oQrHO22UC1dUfJ4OZwvPEwXty2P1PArf9ePk2zwTjX6UG2Xm28rG/MKg/diQo9Fbc8nIMXdZh0bn305pQRHreJFio5rcNIqsrOHay5/RdOA5gVoyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782494952; c=relaxed/simple;
	bh=bmnqIteIrsdazyLdwoN0OJVJpD3EaqY64A0zc/yqpkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A+KPhpkkiQX4ZFGj9w1tlYcyyQFwTYoQqBQXqT4SFlqoiY7cEeer4bodWJw6aGCTJY4JyyRVw9iNd6RWOG5E0yOhsL/+IlFGW/k8jqZfLcfByZbh6v1sjrraPplIt8xTUNawOYNLIWDuHYoxWBhgZrh1BPaOdQ/Ch3M6uhVIiVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOVEp9C4; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOVEp9C4"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e93e0a3364so928232a34.3
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 10:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782494949; x=1783099749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S/VSPjiBxVWzwoGtJrzRhtH5hK8hWcYXUpH5mPgMo2s=;
        b=HOVEp9C4MoqSx8QJQrG+E4MNqNVoojsAitCvjjTmXtFks9SeYrANVfNXQY5q5AbVeh
         msqhqUlgJLFyKsQz5qLla0xvKAch0rlZFmNNeNyfCtQLSt4z4ey6YyKNbXNyYEKfUfxO
         sMnjOqFHzbcPx4djTpEgQdYYRaCMAqcoRLiNLihWZZoRv/BkmRW4FtS8yRrQVxsCOGTe
         2OHNDaVwlTQ2rgsN0VAXuSJFj9oTBq28PV6qCREHrktx17n6CLoo8tf4BCJailNrbIIc
         0U5jyZRzxKMM9zKWsGuEG1G6iXkOBCVswIuyIaRLzp3cY7KlxEk3JGEvKwk+/N+QIaJd
         cDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782494949; x=1783099749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/VSPjiBxVWzwoGtJrzRhtH5hK8hWcYXUpH5mPgMo2s=;
        b=C/5tik6Xf7pIEhe1Q/71Ho/mMREOsBiFzz90zG8ujfy72diBDY8UgNOrtQe21WffrZ
         8ctorp0lFfQGJFlYkNvQDBAn6XtyIXsrNavu7gfKh/HgsnA3/aYbzd6RVVhWPLNKvmqB
         bTbv+BFm8hmphBrdh+B7VZEZstEThJwnIhRp/5es0P+fy71KUpgD8Zn//F2R2Jp9c6PN
         oxKSoMwGAuBU0B7IvigxJqY7O2kiStnOgddDpCET8XKb1rVEW4IeZzlAcBM2rUnomWdD
         5BJJgq+yregYTjBY9WNsldlWstnosgOtNB1Z5UEM6/Xna13e0eJLlhKDeaqjnvsjEKhW
         mRKw==
X-Forwarded-Encrypted: i=1; AFNElJ+ijNngRJFgYE7S0c3x005QvyyPLIohzuTtmUpK4PIRmFDimi5BC3t/gPHXodh8vHT6Phg7jMkHPcklqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmDtqmkZe+BGaQqk/Ma2hQyYuATY/OgoykckNMM0m+YvcEatQH
	Fs6lgtN4UJTuzeAq7yF8a+gijwsH3OrUqhZZbCjSW+9F1971R6L2WvIQ
X-Gm-Gg: AfdE7cli05cWAITujkuw3hCHaD9C/C1D3+zTXA5K8C2t4Flb6Szt2Iq5TQYp7dQkIkE
	t+OTUNlZeIuIuWIj4g5NVg/nGyBJ2M49p+yBI8vx/ph3uByo/5IZ2WjfiwWi37ASUuol0mH1AW3
	OVWrS1lcm6W+5j+ZE1mDrD3GhIiVLOg0xGDWZAoyV/q3amrfmnR6lFdRksgY8M0YawBKumV/aGO
	lJVjzW0cDd0GIOkO5ptf3+8PAnQ84RRDOJNWWDbmNIc9Ysiw63Qe3ZqsULf2WXfLH+M1WrzjZaI
	Qk8M6Y0YJVCikNgx5RsJ7y5xxAJazCxNVAH64Ylp5ie3oLdGaJaLvgLJqqI1ElvjETMmeXYZYPK
	Ljh/FAEWcFu5Qj8uP2h3WcPogswYBryUkYz2/VgDpRA2dXeLw/MXsxre6ply6aNtSOK/GVc2+kg
	34OwRz
X-Received: by 2002:a05:6830:8291:b0:7e6:ed97:ce5a with SMTP id 46e09a7af769-7e99c2ec47cmr6930978a34.4.1782494948915;
        Fri, 26 Jun 2026 10:29:08 -0700 (PDT)
Received: from localhost ([74.80.182.98])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9aa78751fsm2063757a34.13.2026.06.26.10.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 10:29:08 -0700 (PDT)
Date: Fri, 26 Jun 2026 20:29:01 +0300
From: Dan Carpenter <error27@gmail.com>
To: Doruk Tan Ozturk <doruk@0sec.ai>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: meson: vdec: fix use-after-free of prev_frame in
 codec_vp9_rm_noshow_frame()
Message-ID: <aj623aQRkNiVdrnM@stanley.mountain>
References: <20260626164025.52694-1-doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626164025.52694-1-doruk@0sec.ai>

On Fri, Jun 26, 2026 at 06:40:25PM +0200, Doruk Tan Ozturk wrote:
> codec_vp9_rm_noshow_frame() frees the first non-shown reference frame on
> ref_frames_list without excluding vp9->prev_frame. When the previously
> decoded frame was a non-show (alt-ref) frame and the current frame is a
> non-show inter frame, the freed object is the one vp9->prev_frame still
> points to; codec_vp9_set_mpred_mv() then dereferences the stale pointer
> (use_prev_frame_mvs and codec_vp9_get_frame_mv_paddr()), a use-after-free.
> 
> The sibling cleanup codec_vp9_show_frame() already guards this pointer
> (tmp == vp9->prev_frame); rm_noshow_frame() simply omits the same check.
> Add it.
> 
> The fields that drive this path (show_frame, frame_type, intra_only) are
> parsed from the VP9 bitstream, so a crafted stream fed to the stateless
> decoder can trigger the free-then-use.
> 
> Found by static analysis; not yet runtime-reproduced (Amlogic Meson
> hardware required).
> 
> Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
> 
> Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
> ---
>  drivers/staging/media/meson/vdec/codec_vp9.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/staging/media/meson/vdec/codec_vp9.c b/drivers/staging/media/meson/vdec/codec_vp9.c
> index 8e80ecf84..572f418c9 100644
> --- a/drivers/staging/media/meson/vdec/codec_vp9.c
> +++ b/drivers/staging/media/meson/vdec/codec_vp9.c
> @@ -1247,6 +1247,15 @@ static void codec_vp9_rm_noshow_frame(struct amvdec_session *sess)
>  		if (tmp->show)
>  			continue;
>  
> +		/*
> +		 * prev_frame is still referenced by the MV predictor in
> +		 * codec_vp9_set_mpred_mv(); the sibling codec_vp9_show_frame()
> +		 * already excludes it before freeing. Do the same here to avoid
> +		 * a use-after-free of vp9->prev_frame.
> +		 */
> +		if (tmp == vp9->prev_frame)
> +			continue;

I have not looked at this code before so I'm speaking from a position
of ignorance but codec_vp9_show_frame() checks vp9->cur_frame as well.
Shouldn't we check that here as well?

regards,
dan carpenter

