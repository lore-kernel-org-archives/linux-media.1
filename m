Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551799;
	b=fTTWyMEOp6O4ELQd/qZH7UWLT7ynQ3m2z+PAmsD7FwXARPWG9WZMiPpCJ3Gmz78PkBKY
	 Epz8157Korya5jXh3C/XWexdHE3hrYhexqouPxatOhA6urQbm8hOEbb5rdhRvG7siitWj
	 GA3GGG4195/IQigGgUnmOkvnmGaTx7DuoCZSJQdNAhK676pTslxR7PMdH4MFXcA6GhPR8
	 odldFQc9ZYXX7HONAtJ5w6lwysf4UxZROvKmiQx/uIJ4ZG2JESGkNFMq9LeBR/Zs09njy
	 U1d/vBEL7etXiTUlBd4SNy8Rejv/HCwn23DiOKYxUeObx1GnAmNGscdcg3rHy8K1+oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=4zofyjzfJerfRmeIkr2oNO0eYdNNEtzuwuP/HP6VIhk=;
	b=wT8HfYKMwlK052jrMQVJgtpHMAtL86L108PSuyWGg2bU8bc134CBYNvcalCAq3no61pZ
	 98bGn8P/tajyGIrjLC4FCCXvvkBFGxH0Cr+lDsTlNGnJffESJZnOa0CJ1iSZFhGEO6rtq
	 gtX6bwX0ltteOVcbjARnC+AP55T1oa70qG2lHfhAQS1FqfLi1oWt1betR4ldiQS/Y3/r4
	 jpAbeI4g8qqaLAuSLAWuW8cr5PqgxU56Ro3ZZqOxpRNt3fIS94qwB0wk2Cgr/KgRpYz4Y
	 sPU0NvQrLbzIJoxo+EOtClXV7uZOP2hRyC9z+rj41gLeJaKjVztPt7ZgiDweIEA7Kdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=M2tfoTTb;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FE1606A31E
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 20:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77FE1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=M2tfoTTb
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso2300577a12.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 12:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795551799; x=1796156599; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4zofyjzfJerfRmeIkr2oNO0eYdNNEtzuwuP/HP6VIhk=;
        b=M2tfoTTbXppfvrsHKX5jEq9hd/RCDdO9ryu9BnFXnsQDtOecdsz0rElCMUZkZhoROQ
         4RHOZez2dc6erV+EetovQzmIAAhhr3n04P4ZczT13evqMNwzgwZRAxRZojbzwxK1aBs7
         Iqd0kFSUS+BvcARLE1TT3HDqs2T5c2FZt911g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551799; x=1796156599;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4zofyjzfJerfRmeIkr2oNO0eYdNNEtzuwuP/HP6VIhk=;
        b=ergGodQlKDuHZ7J6VmXcVMs+LOqIf2l7qZp9JXEj03xTpr0GZDlfpODDH+2UVnqRFh
         KBAk6WHWC8b2kdRjBSSdVO33LiPSRGUfia5md+povy65HBelRNO4qmo03qca7lOlXIhj
         i6+uoBkOp42QrhocfY9eej1eqho8/PyoiucSrr1IRedOd0b1eqviw2wLBNafSDdGuj+V
         +ORKcjPb1mqKnRjT825xT6aV4THXKa+XdrwMooE4ozP4qAZuR05E7TMulDS0XQ9nuzvM
         HcumoXv2Z3JXHyF3UzKGEW99I2nY9REjxk0Vevic6GT1X9OEzcicqGA2+FtwHswkIiTN
         FTvw==
X-Gm-Message-State: APuU4Z9YPMPB6KkvZnSYdlDrdUmt/ApVItRVXXdGl5yS5fq1/vuR3WEl
	NPRc6/LG6d8XBSRlOPN46r/g2tVpL8eiUkdtVrWfRLQTxgrdnTYVw915gX/sp5ikRIyYu/8fbEI
	fJxY+R9a8
X-Gm-Gg: AZFdTZekOC/9OGlt55JMyB3l6vxSd54F6R6bKtDJFz2cBT42qVG69BRprshuMLC1qtP
	JnVhWY3NApJ068Fw239/0MCdLsmFFR9lhs9rqTXbZUzo7neVE7b4b0w9EkFsPpImFdpv5qYzGK6
	5PAlce7s4ethU0/U9ZW5Z9Im4/epJpOtj9ZFwkLUgGXnmOy4qtvSw+TeyA5TFB/BhnJkH84wHls
	5HchBykkkT2zXnEWBuq9L9TObmcFo7BVWJM1/pWxkkwxozxR35PyrJEtKTgcvOLloVCSFXC4hBy
	v4RYqN2Je4y624t26stY6pmNbdbTFehh4FIobeszho/AYj/pZ+UBK0MxER/ROot2vHUBg2r7zlP
	XZWrv0BV5UjgUb6XeGSPuXNF8Bw3SOZ2PhqpVueseQZQKh/lzhsbsO2Lh2ypoOKC1Ol+a3VArQ7
	6sHb+dd9el10YIOOi3Nkd5WUSEglsoqh8RESkrCo/Q3DyOCeWh+Sru3MbxUhtTD7MhCDCJrkYmr
	jywUJiZOipmZTw71if5/vMIp94+R7zqKMoGignC+gplJRJ+4QXocWzma1JYaP9qbl5yqK+BBtUD
	kjKEOjtWWVwxXB/oNZ2C0gDCyoaRk0BaL2VyHNOEW0nxBJHAi5HbmxBTlpb2+99z/Q==
X-Received: by 2002:a17:90b:17cd:b0:3b3:ab8c:c7e5 with SMTP id 98e67ed59e1d1-3b41c95f65fmr14428253a91.56.1795551798470;
        Tue, 24 Nov 2026 12:23:18 -0800 (PST)
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com. [74.125.82.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm26245205a91.5.2026.11.24.12.23.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:23:18 -0800 (PST)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b3b4944a0eso3726985c88.0
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 12:23:17 -0800 (PST)
X-Received: by 2002:a05:7022:e886:b0:1ac:2f6d:e1c6 with SMTP id
 a92af1059eb24-1b5568a4f42mr19880063c88.6.1795551796265; Tue, 24 Nov 2026
 12:23:16 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124100623.2227323-1-chris.bainbridge@canonical.com> <20261124100623.2227323-3-chris.bainbridge@canonical.com>
In-Reply-To: <20261124100623.2227323-3-chris.bainbridge@canonical.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 24 Nov 2026 21:23:01 +0100
X-Gmail-Original-Message-ID: <CANiDSCtF3jcJmqCpe_4G=w9KeXsmJ3Nu7BYguDmepcq1G-E9uQ@mail.gmail.com>
X-Gm-Features: Aa3M54qMe1F_FiA7W1AJ5MMmW-l8mTpXaFw8QnR6ABNEwslDFeimszZj4ZbPMCY
Message-ID: <CANiDSCtF3jcJmqCpe_4G=w9KeXsmJ3Nu7BYguDmepcq1G-E9uQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: uvcvideo: Restore auto controls first and skip
 inactive slaves
To: Chris Bainbridge <chris.bainbridge@canonical.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Chris

I think it would make a bit more sense to squash 2/3 and 3/3.
Maybe split to 3/3 the functionality to continue even if there is a
restore error.

That would make it much easier to review. Could you do that before we
look into all the boring nits?
(you might not be Santa... but it is almost Black Friday :P)

PS: You will also probably get more attention if you simplify your
commit messages.

Thanks!


On Tue, 24 Nov 2026 at 11:07, Chris Bainbridge
<chris.bainbridge@canonical.com> wrote:
>
> A UVC device rejects a SET_CUR request for a manual control while its
> master auto control is enabled. On the Logitech C270 (046d:0825),
> restoring WHITE_BALANCE_TEMPERATURE while WHITE_BALANCE_TEMPERATURE_AUTO
> is enabled stalls the request with UVC error code 7 (Invalid Request)
> and leaves automatic white balance wedged until power cycle, while
> aborting the restoration of the remaining controls of the processing
> unit. Two rules are needed to avoid this.
>
> First, restore the master controls before the other controls of each
> entity. uvc_ctrl_commit_entity() sends the controls of an entity in
> index order: Auto-Exposure Mode (index 1) precedes Exposure Time
> (index 3) in the camera terminal, but Focus Absolute (index 5) precedes
> Focus Auto (index 17), and in the processing unit Hue (index 2), White
> Balance Temperature (index 6) and White Balance Component (index 7) all
> precede their corresponding auto controls (indices 11, 12 and 13). After
> a reset the device has auto white balance enabled at its default, so
> even when the user has set the auto control to manual mode, the manual
> value is written while the device still has auto enabled, and is
> rejected. Restore the masters first (committing the first pass only when
> at least one master is dirty), so that manual controls are written with
> their master in its final state. A control is a master if any of its
> mappings has a non-zero slave_ids[] entry.
>
> Second, skip the slave controls that are currently inactive. When the
> master was restored in the first pass or is already loaded in the cache,
> decode its value without generating any USB traffic; otherwise query the
> master via GET_CUR using __uvc_ctrl_load_cur() (taking struct uvc_device
> directly). If the master control is write-only or GET_CUR fails, treat
> the slave as active rather than decoding an unpopulated zero buffer,
> matching uvc_ctrl_is_accessible(). Clear ctrl->loaded when skipping an
> inactive slave so that subsequent reads fetch the firmware-driven value
> from the hardware, even on devices that omit UVC_CONTROL_CAP_AUTOUPDATE
> in GET_INFO.
>
> This addresses the restore order concern noted in the TODO comment for
> auto/manual control pairs.
>
> Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
> Signed-off-by: Chris Bainbridge <chris.bainbridge@canonical.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 152 +++++++++++++++++++++++++------
>  1 file changed, 126 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index f70fa37800a4..d11ad3da1d50 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1463,7 +1463,7 @@ static int uvc_ctrl_populate_cache(struct uvc_video_chain *chain,
>         return 0;
>  }
>
> -static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
> +static int __uvc_ctrl_load_cur(struct uvc_device *dev,
>                                struct uvc_control *ctrl)
>  {
>         u8 *data;
> @@ -1482,13 +1482,12 @@ static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
>         }
>
>         if (ctrl->entity->get_cur)
> -               ret = ctrl->entity->get_cur(chain->dev, ctrl->entity,
> +               ret = ctrl->entity->get_cur(dev, ctrl->entity,
>                                             ctrl->info.selector, data,
>                                             ctrl->info.size);
>         else
> -               ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
> -                                    ctrl->entity->id, chain->dev->intfnum,
> -                                    ctrl->info.selector, data,
> +               ret = uvc_query_ctrl(dev, UVC_GET_CUR, ctrl->entity->id,
> +                                    dev->intfnum, ctrl->info.selector, data,
>                                      ctrl->info.size);
>
>         if (ret < 0)
> @@ -1509,7 +1508,7 @@ static int __uvc_ctrl_get(struct uvc_video_chain *chain,
>         if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
>                 return -EACCES;
>
> -       ret = __uvc_ctrl_load_cur(chain, ctrl);
> +       ret = __uvc_ctrl_load_cur(chain->dev, ctrl);
>         if (ret < 0)
>                 return ret;
>
> @@ -2572,7 +2571,7 @@ static int uvc_mapping_get_xctrl_compound(struct uvc_video_chain *chain,
>                 return -ENOMEM;
>
>         if (which == V4L2_CTRL_WHICH_CUR_VAL)
> -               ret = __uvc_ctrl_load_cur(chain, ctrl);
> +               ret = __uvc_ctrl_load_cur(chain->dev, ctrl);
>         else
>                 ret = uvc_ctrl_populate_cache(chain, ctrl);
>
> @@ -2816,7 +2815,7 @@ int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl)
>          * operation.
>          */
>         if ((ctrl->info.size * 8) != mapping->size) {
> -               ret = __uvc_ctrl_load_cur(chain, ctrl);
> +               ret = __uvc_ctrl_load_cur(chain->dev, ctrl);
>                 if (ret < 0)
>                         return ret;
>         }
> @@ -3227,43 +3226,144 @@ static void uvc_ctrl_restore_error(struct uvc_device *dev,
>                              name, err_ctrl->info.selector, entity->id, ret);
>  }
>
> +/*
> + * Return true if the control is a master control, i.e. one of its mappings
> + * has slave controls.
> + */
> +static bool uvc_ctrl_is_master(const struct uvc_control *ctrl)
> +{
> +       const struct uvc_control_mapping *mapping;
> +       unsigned int i;
> +
> +       list_for_each_entry(mapping, &ctrl->info.mappings, list) {
> +               for (i = 0; i < ARRAY_SIZE(mapping->slave_ids); ++i) {
> +                       if (mapping->slave_ids[i])
> +                               return true;
> +               }
> +       }
> +
> +       return false;
> +}
> +
> +/*
> + * Return true if the control is currently inactive, i.e. it is a slave
> + * control whose master is not in manual mode.
> + *
> + * The master value is read from the driver's cache when available, or queried
> + * from the device via GET_CUR if the master was neither restored in the first
> + * pass nor loaded yet. If the master control cannot be found in the same
> + * entity, is write-only, or fails GET_CUR, the control is considered active,
> + * matching uvc_ctrl_is_accessible().
> + */
> +static bool uvc_ctrl_is_inactive(struct uvc_device *dev,
> +                                struct uvc_entity *entity,
> +                                struct uvc_control *ctrl)
> +{
> +       struct uvc_control_mapping *mapping;
> +
> +       list_for_each_entry(mapping, &ctrl->info.mappings, list) {
> +               struct uvc_control_mapping *master_map = NULL;
> +               struct uvc_control *master_ctrl = NULL;
> +               s32 val;
> +
> +               if (!mapping->master_id)
> +                       continue;
> +
> +               __uvc_find_control(entity, mapping->master_id, &master_map,
> +                                  &master_ctrl, 0, 0);
> +
> +               if (!master_ctrl || uvc_ctrl_mapping_is_compound(master_map))
> +                       continue;
> +
> +               if (!(master_ctrl->modified &&
> +                     (master_ctrl->info.flags & UVC_CTRL_FLAG_RESTORE)) &&
> +                   !master_ctrl->loaded) {
> +                       if (!(master_ctrl->info.flags &
> +                             UVC_CTRL_FLAG_GET_CUR) ||
> +                           __uvc_ctrl_load_cur(dev, master_ctrl) < 0)
> +                               continue;
> +               }
> +
> +               val = uvc_mapping_get_s32(master_map, UVC_GET_CUR,
> +                                         uvc_ctrl_data(master_ctrl,
> +                                                       UVC_CTRL_DATA_CURRENT));
> +               if (val != mapping->master_manual)
> +                       return true;
> +       }
> +
> +       return false;
> +}
> +
>  /*
>   * Restore control values after resume, skipping controls that haven't been
>   * changed.
>   *
> + * The controls of each entity are restored in two passes: first the master
> + * controls (the auto modes), then the remaining controls. This way a master
> + * is set to its final state before its slaves are restored.
> + *
> + * Slave controls that are currently inactive, because their master is not
> + * in manual mode, are not restored: devices reject SET_CUR requests for
> + * them and some firmwares misbehave when written in auto mode. The manual
> + * value only takes effect once the master is switched back to manual mode.
> + *
>   * TODO
>   * - Don't restore modified controls that are back to their default value.
> - * - Handle restore order (Auto-Exposure Mode should be restored before
> - *   Exposure Time).
>   */
>  int uvc_ctrl_restore_values(struct uvc_device *dev)
>  {
>         struct uvc_control *err_ctrl;
>         struct uvc_control *ctrl;
>         struct uvc_entity *entity;
> -       unsigned int i;
> +       unsigned int i, pass;
>         int ret;
>
>         /* Walk the entities list and restore controls when possible. */
>         list_for_each_entry(entity, &dev->entities, list) {
> +               for (pass = 0; pass < 2; ++pass) {
> +                       bool master_pass = pass == 0;
> +                       bool dirty = false;
> +
> +                       for (i = 0; i < entity->ncontrols; ++i) {
> +                               ctrl = &entity->controls[i];
> +
> +                               if (!ctrl->initialized || !ctrl->modified ||
> +                                   !(ctrl->info.flags & UVC_CTRL_FLAG_RESTORE))
> +                                       continue;
> +
> +                               if (uvc_ctrl_is_master(ctrl) != master_pass)
> +                                       continue;
> +
> +                               if (!master_pass &&
> +                                   uvc_ctrl_is_inactive(dev, entity, ctrl)) {
> +                                       uvc_dbg(dev, CONTROL,
> +                                               "skipping restore of inactive control %pUl/%u/%u\n",
> +                                               ctrl->info.entity,
> +                                               ctrl->info.index,
> +                                               ctrl->info.selector);
> +                                       ctrl->loaded = 0;
> +                                       continue;
> +                               }
> +
> +                               uvc_dbg(dev, CONTROL,
> +                                       "restoring control %pUl/%u/%u\n",
> +                                       ctrl->info.entity, ctrl->info.index,
> +                                       ctrl->info.selector);
> +                               ctrl->dirty = 1;
> +                               dirty = true;
> +                       }
>
> -               for (i = 0; i < entity->ncontrols; ++i) {
> -                       ctrl = &entity->controls[i];
> -
> -                       if (!ctrl->initialized || !ctrl->modified ||
> -                           (ctrl->info.flags & UVC_CTRL_FLAG_RESTORE) == 0)
> +                       if (master_pass && !dirty)
>                                 continue;
> -                       uvc_dbg(dev, CONTROL, "restoring control %pUl/%u/%u\n",
> -                               ctrl->info.entity, ctrl->info.index,
> -                               ctrl->info.selector);
> -                       ctrl->dirty = 1;
> -               }
>
> -               err_ctrl = NULL;
> -               ret = uvc_ctrl_commit_entity(dev, NULL, entity, 0, &err_ctrl);
> -               if (ret < 0) {
> -                       uvc_ctrl_restore_error(dev, entity, err_ctrl, ret);
> -                       return ret;
> +                       err_ctrl = NULL;
> +                       ret = uvc_ctrl_commit_entity(dev, NULL, entity, 0,
> +                                                    &err_ctrl);
> +                       if (ret < 0) {
> +                               uvc_ctrl_restore_error(dev, entity, err_ctrl,
> +                                                      ret);
> +                               return ret;
> +                       }
>                 }
>         }
>
> --
> 2.53.0
>
>


--
Ricardo Ribalda
