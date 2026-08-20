Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFB94052B3
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 09:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787219011; cv=pass; b=G/LCx/iiwWvBKhssXe8i7uLy3J7xFuYyC9XEn1wqKX5bWiSI2tCAygLxcJ4SCjHxe7XhbO7xhHXOmyu0nA3xZoa6zZVvualWHm5641/XghM4hPwGhjchQ7Low3nb1RuIluSwDnPooOMcEtLWr/cIavkGczt78eKD5UeQYydXMbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787219011; c=relaxed/simple;
	bh=G+JdTeJQq0pr7iS7bb9FzdMALBaAbEG+ciLqybSRxz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bklzMH6Eyc+8xqGL4y61ZvSUjHneO/7n5Vhs90xnBvFhCuJ0KFxZC262lS+tnPkSYUjTao8zc9mWtsw3m3+FxwuNM9IXntGVnIHs490uctWzkymOOar42s03lFTK9yVEs8KnFSLEZlvGQU02Ei7ro0FJjOGs7fDKUiPl5X+EOPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=koTMunL8; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="koTMunL8"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b45f1cd80eso2110275e87.2
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 02:43:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787219004; cv=none;
        d=google.com; s=arc-20260327;
        b=kM6/k+i6QyMrAW+0CLk+4Dt9K104n7Es3VgHE/dHUJmLDUkhzxN2TFtMBjQ92boyCw
         oDOfN6SvlPTvP8thGB6cW7WU2wsVMeyoJwmFoWbllNE0T/mPrvw6VLBB7hbcsG0yPNxf
         1ioQYGs+Z1MjFjrdYChVqu/ZYr6XOVXPAds9gIyCoz6O+1tKcrM/3wKz4UQv8vfn+yo7
         pYRcIQLOkXQKJTnRLfnTKjNyqV1yEcDv6kaS8A+0RqCLqWlNyPiT9zfx+FlH7pYAy0Hs
         +7eVD1OqcRkgJ1xL+1WJ9Ou6kWLHWjRrYqmoV/+J1i/kKB0vaVwHRhmQAd510quGXpar
         GYEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zqIzG9we7iC4nX3NaFcZE/0dBqUJjndgXhe2+QDZLJA=;
        fh=11JlvQAlJ5qQcS2Huf98rJxvd324Yk2SF83g0plj/B4=;
        b=AEjMLlXVi5EOAvlTblOHPyVrAK9NPsHTe2XxdpHR9WW/vrzc+uGr4rWwc1kbq4581l
         hdxYGW0fSJh8kKIBWSyYpfnvOmtHezu+D2tI5UokJwrP/kXBQH1S6H5E9sKoFw0TZ2t1
         wZmktFbdBxvIPEchYuDTbYWaaZcHXBbBR6oakKavzhSz8PbFTnq5zF8g145WGTZ6m4JH
         v52O6854R1v7rVFh66O5Dw74sKfPkEY9PsZiEWvimsIiEH8Jt4QJycY5BBj9Ez1f/pkG
         VdOQutt7McyQwM3+eoaM3k/DrRZH2WXoXyjKf9jFkvg/rqXDpGrBmz5TY5LjNZYcdJJr
         Yqtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787219004; x=1787823804; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zqIzG9we7iC4nX3NaFcZE/0dBqUJjndgXhe2+QDZLJA=;
        b=koTMunL8rDhc3AgibgfoUIN1neg6VnXYdBPfM2Q/IEmSft/R3ooJu4OqIQeLIYfO9Y
         DksgzGOqOQY7gKnNrrB923/P0JcC063eK4cDgn8L3T0PB6Yan/ZuORJY6XLN+XS85yxC
         7y6y7x3bWKYIQ0GeiZ4Ohn87ekEsjP1/YtQ4oRqhPPW/AyVxXkqb/tuLhpfNZL5JRSf/
         Ax1KQytYiOrlwsvVNdXxtBCwYBIHWWoYVFvhl2ueIfNi3fxVu3XG3PmPePVBs1XNSNex
         sp22Pq92ProW68QN2nFFIK0P4OMUEySO1NfKZyM0ryxXRJw1GzwEwmgS3BGrfHZ0KSy0
         yxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787219004; x=1787823804;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zqIzG9we7iC4nX3NaFcZE/0dBqUJjndgXhe2+QDZLJA=;
        b=qI29iEYK83mD8cpVV3FZvlB45yigYRc7miPatf4rC1fJ4RizWQ/ngKD2V1XU91HqSX
         3J7g4uXmlFGbmiRHE5XoEuqmCyjH7oj7Dm/lj+qmzgnuG4gjsVdyGYE0mS6mimXdU1Bo
         mkY0LTKW6qC+Cw+8JkhScqK+llRNYzBFS+oS2qG2mDm+vOJVpGqiaLm24bP/97YSdFrm
         B6npjU+q2+tGuIbIa4QlbEFCPu6h0zvvOWSZnt3b6HSTSOUmu/S7svdOkc5SV09pNa/A
         OYUKwabHHQAozSl41FsjZCiL+S2D/lUJ4Egpx9f6BO/ZBlDinqRjYbD0EBG/rrxJou58
         f5+A==
X-Forwarded-Encrypted: i=1; AHgh+RrW7KJ8g87XD2NWbbSkrkJ6SwDKDlXJN3bVRTs8junvLVEU2tpgS/fquymFv6mDuWxV+FaXMmktLjH5xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOjurKtZg8QM7q/nhI3XtdSp9XD2vKK4QZrcanoIsU9B9kjfUc
	iWJOt7W/SDP8dudaIOFmjPXDza8pzAnWvx77GFmuA96Nl29Sg6PEi2keIu37BFBDGRLkhBEim9b
	mrc3C5oCPKubK20UM4WFxpAQVHVNutg4=
X-Gm-Gg: AR+sD11QNsI262+9+onLTdcX5aLNNrlHm0sguHtSAV834J3Z4sL0Q45a2FkZW18T8wV
	chH1eDqzaxGLf/CbyVrWyPg2aRuwnd1DBpUklX3Cba1He0kR/yV1hTKycrCiJEcsP6sjPB4gI7I
	ptiqnf1rOnnaIIwcbXOzxwZchMC8TMll0WJ9VoLNwYM8cRRdFtvoVCrYDsC0Kpv6o0Dnuho4XQX
	7FuAP0WVxx241C1i+9ECPXpB0KKJml+kFfuFgJ91ikwDPb7wP6f9aMmRBFxkL2cgSP0au+Tzmil
	9EVvVvb4NPqq87fUjlaSoWEOBK6YXzvzkDzY68XgL1XkQHj1tQ==
X-Received: by 2002:a05:6512:b9c:b0:5b0:2190:1470 with SMTP id
 2adb3069b0e04-5b478b51c21mr3881343e87.3.1787219003906; Thu, 20 Aug 2026
 02:43:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiDSCue8yyiGubzbAybRqSUTTFuB=-Y2TZy6yvOx32SpAASWg@mail.gmail.com>
 <20260818094010.353021-1-natalie.klaus@runtimeverification.com>
In-Reply-To: <20260818094010.353021-1-natalie.klaus@runtimeverification.com>
From: Noam Ben <noambs2999@gmail.com>
Date: Thu, 20 Aug 2026 12:43:38 +0300
X-Gm-Features: AcwNN1X2yBoaLxLKbSIKJ3piZR9gEzwFHj1FwGEfNVXXRItFU9BZfmlTLpnOEyM
Message-ID: <CA+toCPcbZYVGUVYqEW7AfbnLEdKhE+ogse+PaBeNZi1MKz_8ag@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Skip frame descriptors with a zero
 computed size
To: Natasha Klaus <natalie.klaus@runtimeverification.com>
Cc: ribalda@chromium.org, laurent.pinchart@ideasonboard.com, hansg@kernel.org, 
	mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Yes, thank you.

Sorry for the slow reply, I was away for a few days.

I'm happy with the changes being folded in. Let me know if you need
anything from me for it :)
I'll be away again for about two weeks from Sunday, but I'll try to stay
reachable where I can.

Thanks!


On Tue, 18 Aug 2026 at 12:40, Natasha Klaus
<natalie.klaus@runtimeverification.com> wrote:
>
> On Tue, Aug 18, 2026, Ricardo Ribalda wrote:
> > I think we need to have some consistency. We cannot have  one
> > condition returning -EINVAL and the other skipping it.
>
> Agreed, and your shape is cleaner than mine.
>
> > If Noam is okay with this, perhaps Natasha could prepare a patchset
> > with the 3 patches? (keeping Noams author on his patch)
>
> Happy to. Noam, are you okay with me carrying your patch in a series?
>
> One question on placement before I write it. Your comment puts the checks after
> the frame interval parsing, which is outside the !UVC_FMT_FLAG_COMPRESSED
> branch. Frame based formats legitimately carry a zero
> dwMaxVideoFrameBufferSize, set unconditionally at uvc_driver.c:265 because the
> frame based frame descriptor has no such field, so a zero check there would skip
> every frame of a conformant frame based device. Did you mean the checks stay
> inside the branch with only the return value changing to -EINVAL, or outside
> with an explicit frame based exemption?
>
> I will test the refactor before sending.
>
> The Media CI failure on my patch is the missing dependency on Noam's v2. The
> series fixes that.
>
> Natasha
