Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42594F93C9
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 13:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737524; cv=none; b=uNDKC0Wqu8rgDov+fnaD3cb9dWUPOti5cdCRjUXQP6HadgyOFV6CABULLKR0Jgw3iUnmUEW2Dh++2wR96pxbX3tsPM4VKLHC4WJmsL1t+FIfm0Cu5xtDbH/arUp7AWtXTQ5yhN6wsK3TK4RKd8SGu2Pw7avYhtAKJCnvH/qzxk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737524; c=relaxed/simple;
	bh=MXMecSS5un1Vw5RPUBhc/MQTR/N1uDtr5TFfUDNnDkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pJE9dlkLBEIGswWdXDizW1MsDlUjK9SxWVkbg/8EYvagg5Y2o7vs4i1AawF3ZiznBlgGoqMx5XzF9KtTVey3YfndFKRnOEMRPPzAbh1MHN7P9+PPNrG8xamm/ubRdj29U0u4J6yfTlXatxPg95dlOkom/BANs4havEMdssR1MUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SMp35hXi; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMp35hXi"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so4241035e9.3
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 06:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789737519; x=1790342319; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FSYhKatlju631s2mF43cFtG3PZ8R0OZ445m3aP3hlTo=;
        b=SMp35hXiJaeVNxYiS6HIgTgEB/vqI1gkvKZ56xzpON6sbNsdZriJw+qSAgJ3MRE77i
         QudT/8aAVob0I/o06oGLP1KdduYUkzMv9TzJgqw+ua2H1ZS5kEbvxdyjmOW0thayeBGN
         PwXhOg2FqNZaAs/HQTmG6QIi/Ag1ma56Hr3aJ9wVb8vKLo0hj3xKcxqu0C2bcM5UTxRp
         SvSLsuj2+kyqHPuHW6eX0L3VWcB2kGshWm6ki3LNZ52lb05hZslT/5RKGiKOBlD37BuM
         s/MhhDs7/Y4hWSd4GC+hWI5iQK8XV5qULBYcnesbbyceJjZ22PsvgQozbJlRflDIDV/M
         pa4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737519; x=1790342319;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FSYhKatlju631s2mF43cFtG3PZ8R0OZ445m3aP3hlTo=;
        b=Kat+RmvLI0Emh2Id93A4AWxqSjr9qJPDhEXNyBNDVWvCANAR03EzvUiGtw5p/TxKzK
         FcO+Vuij1rcORAXFvdT/XLP5843RPUfqrY4MF5qS+KgV9XMmxXtKy7cpUdmjZ+OIu0Ht
         cLHBBp105u3Gzv8LiibPIXnkcXnTuVQYPGTw3Do5A6M5SNGnXBR73EXl/r2BhjT7uvZx
         wKs4fOa2YkIVPhu9yxd2Z0iSa7Lje1knlFS39xh+JhuGKP0G7Q8NMNiY/ES5hN/MDK93
         7D9o4MYy70J2tfH8XflpfxYUYe6dlsYU4DwBqJ69PbA1+CbX6PzZQ94d7auwhdRSCDDS
         UEqA==
X-Forwarded-Encrypted: i=1; AKwUvBwkL1KFSjjBvMoag/FJzN1OIn4cW5gx5hd9rOTjhSrguqut4S0dkSHo6qNQA7MPbIpv9kf9otmpobJlHg==@vger.kernel.org
X-Gm-Message-State: AFuF++lk/nvQlpo0MeozeAFUf6MVhbEQ9K7kF9DivlGnNkl/uJ4gvpj+
	ha2o4QQ9xmu56Q4fZ1/euvovstU0ueb1OXgxVLbz3a7jJFTm104UnpGN
X-Gm-Gg: AYBFou3JrNxOEoDf0mEpURz9R3Ib/pKeUkRB+wzT5M8q8LSpFhFCWFzmHXn5hDgq48y
	Z5b/2/qUBA6NdBWY7WHObJ6S3IIasGheF4Mg0M/THSpzpYTS6QU18NQ4Ifr8fYSUAlcOnsIhb0Q
	LsAnTHQydMQqv9OBohC3ns/dyZ+EspvZPvxP1HH6zG1nEY8rHCS6bti4H/L0wBeP1eLpB3gvd8x
	oJ93R8RgaJ5813XJ9DQiEC9DEOdEeoaASuo1UtrTBKJpRjJS903H1lOJXN8bYIQX11u7XvYDbet
	EIj7SG8qgTGKLH8dl4zvC0lM8nL+wZE2tbfk7q0RgX6jXIO0+iUyrq08N79NA8GLHMh1KqeMm7r
	UcCF1eUeDPT7SqN6fEUAcjx+omOgZIiKIIoFxa6hm2v4P0pyICWPZ+xMZzEiI/TZaZSLBp+93hL
	2KrxZG11zeVz8n+LUIi4wx++yk6R4CYDF4FV7KoJGfMDGyRKvVhbcD4shHP38MWBWJzhSQ
X-Received: by 2002:a05:600c:548c:b0:49e:6e7c:d895 with SMTP id 5b1f17b1804b1-49fc584fee0mr32705835e9.26.1789737518934;
        Fri, 18 Sep 2026 06:18:38 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872008fe3csm4156879f8f.37.2026.09.18.06.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:18:38 -0700 (PDT)
Date: Fri, 18 Sep 2026 16:18:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, Yunke Cao <yunkec@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Fix buffer overflow in
 uvc_mapping_get_menu_value()
Message-ID: <aq06Kq-3n2R79YZL@stanley.mountain>
References: <aq0siVcghDe6x9cs@stanley.mountain>
 <CANiDSCtiVU1PJh7=Pb56PNGF0s=cxfe1kVjwW+7O9JOT5CrDAw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCtiVU1PJh7=Pb56PNGF0s=cxfe1kVjwW+7O9JOT5CrDAw@mail.gmail.com>

On Fri, Sep 18, 2026 at 02:59:29PM +0200, Ricardo Ribalda wrote:
> Hi Dan
> 
> I believe that for all the uses of uvc_mapping_get_menu_value we are
> already doing bound checks:
> 
> index >= BITS_PER_TYPE(mapping->menu_mask) in uvc_query_v4l2_menu()
> value> fls(mapping->menu_mask) -1 in uvc_ctrl_clamp()
> BIT(i) <= mapping->menu_mask in uvc_menu_to_v4l2_menu()
>

The problematic caller is uvc_set_le_value().

	value = *(s32 *)v4l2_in;

Smatch thinks that is called from uvc_mapping_set_xctrl_compound().

drivers/media/usb/uvc/uvc_ctrl.c
  2772          data = memdup_user(xctrl->ptr, size);
  2773          if (IS_ERR(data))
  2774                  return PTR_ERR(data);
  2775  
  2776          return mapping->set(mapping, size, data,
  2777                              uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));

But maybe that mapping->set can't point to uvc_set_le_value.

> In any case, I think this patch is still worthwhile. It will help us
> avoiding bugs in the future (have you found this with a new test for
> smatch?)
> and if we go that way it is probably a good idea to also "fix"
> uvc_mapping_get_menu_name()
> 
> 
> On Fri, 18 Sept 2026 at 14:20, Dan Carpenter <error27@gmail.com> wrote:
> >
> > The "idx" value is a user controlled u32 so we have to bounds check it
> > before calling test_bit() to avoid reading beyond the end of the bitmap.
> Maybe change the commit message as well to avoid stable cherry picking
> it blindly (sorry seems like I am more picky than usual  :) )
> 

I mean if uvc_set_le_value() turns out not to be a bug then, of course.

> >
> > Fixes: 4e15c535659b ("media: uvcvideo: Support any size for mapping get/set")
> I believe this should be:
> Fixes: 40140eda661e ("media: uvcvideo: Implement mask for V4L2_CTRL_TYPE_MENU")
> or no Fixes at all.
> 
> 
> 
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 3ca108b83f1d..f157ed99be4e 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -538,7 +538,7 @@ static void uvc_mapping_set_s32(struct uvc_control_mapping *mapping,
> >  static int uvc_mapping_get_menu_value(const struct uvc_control_mapping *mapping,
> >                                       u32 idx)
> >  {
> > -       if (!test_bit(idx, &mapping->menu_mask))
> > +       if (idx >= BITS_PER_LONG || !test_bit(idx, &mapping->menu_mask))
> >                 return -EINVAL;
> 
> What about using BITS_PER_TYPE(mapping->menu_mask) to be consistent?
> 

Sure.

regards,
dan carpenter

