Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9877244C51D
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 06:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578689; cv=none; b=eUtFm/WTW03p61Txh0lZIghjLa1IrBg2Evm+b7eCXQOVkFvDQBuBE7lj2IJOCM4y+BV2/mJsRUxn1cHEp5Mibo6dBcstIUhqd0sDWS0sitkQpVsG5duEHPoHW144aXxAt5loJ75bWRnxW1PZViUlTLhRomBsGj8Sa//XX6guFc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578689; c=relaxed/simple;
	bh=YuK61F7k/rSoU0uw5Dg5cXbqHjHe/G9clpwYicDbyeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MQh+4ejVxt1eTcLTzWxzs2LU4hWRNuz77jxBjP+c3qE/NTylGOsa7D1QjSJrWSYW0XmbhJj/VEj6+/dlSBlQMNKhYBlOfPrU8xKzuV1L+wej8VxuLmtlB9fMGwYB/aHOBkmp7J469whgxNx0JJLNsjxPeA6FmG2e2qxpNq+v1ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=S+VZ0Dtt; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="S+VZ0Dtt"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc4aa0f1a94so771116a12.2
        for <linux-media@vger.kernel.org>; Sun, 27 Sep 2026 23:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790578681; x=1791183481; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ksa2sNXJPSNoTaKAca6K+XVzGYsQFC4DIMIyH08mj4w=;
        b=S+VZ0Dtt8UolCk2ySlbpdi8oBQrzPmMGzlLrLUYzSggSg4UTXEN8XG9ex3AJQO6Abs
         gBRUpSz17zjHdvBLIeH46ijcvvc5qGXC7o+NTmNv61LGnB8IjvDqq7umsr1dU4J1VVP/
         Ib+amkQCKAdtcu3fj+qC4RlBliOoP0IQsY6wg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790578681; x=1791183481;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ksa2sNXJPSNoTaKAca6K+XVzGYsQFC4DIMIyH08mj4w=;
        b=R4NLzjtZc9Zh9AVsJK5tbsY76CTAUoBNcgWgOwwKCootMklEXu9S01+48OSmk18Bq3
         HPMY3sH9vcs1pLubfalkUMRw0pmzuV3B6TIN9t4og9C8H9nAJccqYML4cnoKpvCQ7uLC
         qo76MpKKnWCjnyRpDBGdBJsJ+Tf8s1QlCwRsXSCioT3NMANdr5su2xXAK3+58fBfmnCd
         f1r/77QW7GRdLNVFw2g5lI84lmGKeEftsDrTCF5CiLv5c8oK3GeJXIBZKnqJnYPjtr0I
         a45hYXo1hQD6yMTmuoLtjZEIsUYA9AqANMlWzDLjNU4bm+9OyEKGyweKThMC5PXkhqH5
         Fe5A==
X-Forwarded-Encrypted: i=1; AKwUvBxjsbiXruSbxOpslvz1y3qofSdI125WCjfK/fAijNutqZiZT7JHr7hINBCUNNWtjrAjpoIp0hqKrnVGcw==@vger.kernel.org
X-Gm-Message-State: AFuF++mX9/Zs/Jk0rtXr3ypISqFkdtgt+iX3RGFH3ZqUsnjCKnlUFOrr
	4/gPSz2D+FUEJXas9RlBXaUCHtScwxBqb5qYQBq2cnXYbNEz7bNTL4VIspWLt/SAbatFtq5Dhdg
	3V/0=
X-Gm-Gg: AYBFou3FZ6uLGnYNE/l1XANAG3PuNQlFqh6WiZpc3p+tsMsgJ8RZrKhUJbLFQ1Hdj+w
	bhnJOnvv3JIa0YIn8HahpPLzCX6vCdX0q/JSxs7swxNyEmbLTmP7OsurivAa/goSSsfjhJDvUPv
	JXSbyLvQYv9APnuKRX5NvbNVvgfeLybo5va0/9Ku4Ppb1lt2P3B2I9zdlRqo9nShpMMiecVIZNz
	k0bszBMD3auAepZnLwYZco6dmjGmeKW+XmJrcGj5OBpQpa/Z1b3TH5ZowkxC4lj1BycsACooK9m
	f6NhNMHMnSrPo+TxhknW8/faFYYQWHYySgIcYl/sBawWfHNcR0FuybEE49Gu2pncROAsBgT7AP0
	ml8kdElX0eirVHgNqtrqLvdH7F8n1eKp4MkHuINYU0rK1BBOYpEDvdJRoOvi5YLcZX4bbz+UJeX
	bNiOP/n8YbmnEOTMyv5NXUa3wK3s/IQoZOkijTaBy4dgU+Ym9KfAwOAKa+amjPxEvs9TNt49haf
	LvdNEVHxSHFTr8WK1rrO965lU8B0bdvvEcj1Q==
X-Received: by 2002:a05:6a20:5491:b0:3de:4f56:cf01 with SMTP id adf61e73a8af0-3de4f56ea7fmr4052451637.58.1790578681462;
        Sun, 27 Sep 2026 23:58:01 -0700 (PDT)
Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com. [74.125.229.170])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc787905415sm4045556a12.10.2026.09.27.23.57.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 23:58:00 -0700 (PDT)
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144df39b6cfso1939254c88.1
        for <linux-media@vger.kernel.org>; Sun, 27 Sep 2026 23:57:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBza7kA9Vadq8d/o7FAqEOBPyG/UOsJZwT4Bde3ZLNVTR8sA6PlsjBV6gfi80uI9zQfo15+L8uYQ+isy0g==@vger.kernel.org
X-Received: by 2002:a05:701b:2618:b0:146:852d:60b7 with SMTP id
 a92af1059eb24-146ce1a9fa4mr7123265c88.8.1790578677319; Sun, 27 Sep 2026
 23:57:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902002553.34839-1-jordan.mymail@gmail.com>
 <20260902002553.34839-4-jordan.mymail@gmail.com> <CANiDSCvBkMDS9eSRRVoMqQT41c2uq+MQtUFHPm0gGuv13FWevQ@mail.gmail.com>
 <20260927220625.629672-1-jordan.mymail@gmail.com>
In-Reply-To: <20260927220625.629672-1-jordan.mymail@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Sep 2026 08:57:43 +0200
X-Gmail-Original-Message-ID: <CANiDSCsBbns32PGir2JCZ8Ofv9CpXgjV50k-vszmFY-jT-2WNg@mail.gmail.com>
X-Gm-Features: AclHuK_lmC3xPTa7GiwCuz3Qiv72zKIW67dqijrDrJVyGb8R2iwkNOlb0-TaFyc
Message-ID: <CANiDSCsBbns32PGir2JCZ8Ofv9CpXgjV50k-vszmFY-jT-2WNg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] media: uvcvideo: fix up missing AUTO_UPDATE on the
 OBSBOT Tiny 2
To: Michael Jordan <jordan.mymail@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michael

On Mon, 28 Sept 2026 at 00:06, Michael Jordan <jordan.mymail@gmail.com> wrote:
>
> Hi Ricardo,
>
> On Wed, 2 Sep 2026 08:34:34 +0200, Ricardo Ribalda <ribalda@chromium.org> wrote:
> > Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Thanks for the reviews on v2.
>
> I have a question about how to handle a second device. I now have an
> OBSBOT Tail 2 (3564:fefc) and it has the same defect as the Tiny 2.
>
> Its GET_INFO bytes match the Tiny 2 control for control:
>
>   CT_PANTILT_ABSOLUTE   0x03
>   CT_PANTILT_RELATIVE   0x03
>   CT_ZOOM_ABSOLUTE      0x03
>   CT_ZOOM_RELATIVE      0x0f
>   CT_ROLL_ABSOLUTE      0x01
>
> Without a fixup entry, pan_absolute reads back the commanded target the
> moment it is written. With entries for 3564:fefc on top of v2, all three
> controls report the live value on GET_CUR, both during a commanded move
> and when the camera changes them on its own:
>
> - pan/tilt position and pan/tilt speed follow the gimbal under the
>   camera's subject tracking, with the host issuing no requests;
> - zoom follows a zoom change made at the camera.
>
> I checked the other AUTO_UPDATE controls the same way as for the Tiny 2.
> White balance and focus only echo the last SET_CUR. Exposure time reports
> live values until the host writes a manual exposure once, and from then
> on echoes that value, across a power cycle. I would leave all of those
> alone, as on the Tiny 2.
>
> So the change is three more table entries, identical to the Tiny 2 ones
> apart from the product ID. v2 still applies cleanly to media/next as of
> 2dcdfb625c3b, so nothing else forces a respin.
>
> Which would you prefer?
>
>  a) a v3 with the Tail 2 entries folded into 3/3;
>  b) a v3 with the Tail 2 entries as a new 4/4, leaving 1-3 as reviewed;
>  c) leave v2 as it is, and send the Tail 2 entries as a follow-up patch
>     once v2 is applied.

I prefer b) because c) cannot be tested by media-ci.

>
> I lean towards (c), so that a reviewed series is not disturbed, but I am
> happy to do whichever is easiest for you and Laurent. In any of the three
> I will include the Tail 2 lsusb -v output.

BTW, I am curious, did you hear anything back from OBSBOT?
Could you also report this to them?

Thanks!

>
> Thanks,
> Michael



-- 
Ricardo Ribalda
