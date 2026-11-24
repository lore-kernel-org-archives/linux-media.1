Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795548143;
	b=uiR2IFiqi4o85lOeoYVhiHn0bnLInOTiJ+g5uvGdmeeVc/sDYfwauTPZ5b85EfON3fi3
	 Shb/2hVfZzOq1A6rE2CyU0vDSCsQPrVpiojjSWSqHNa/7JA2nGzYiNpyYW2zk9VYmWLIV
	 Bch4cchpZSnKTzo6CbdeWCQZfq+4sv4/jpZvFwhhUzF8dV5qlCbynucQnNvSU4dM7JJ8u
	 qG9tTDiH0qMDmfzsxONm22VzKDs7Ju0TR+x/WnwBLHZU19Dr2cbFo3C6tTC365npKDHqi
	 o9EcGGxwj8adDs//An+v0Uu5QzdDx6y5LhZo6FfZvIlN7z7n4UnGYHoLNQ/nLIctwwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795548143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=+sqGc9BB0de+o0BtnP9Aq7Fkyx+O52AcgmtWyPr0TiA=;
	b=bGLzqG3XH24s/PxHqQeKr68dOYcE8fApd+5v0aQEzf2Dz5HsuhrLh6xc3/Uiyq8zRqsN
	 Zv3kO4VCQYQ/nDw+F7erF+YRFtgDCQfGGl+aBAT4VMaLc8LieNnGF7tgubZ4UcxeNoDWy
	 qqCwVkhyBwe0VkFfhQ7suXYAyiAOmdBbdBbUpFWukw16MaX6+0Y7WZApA3gxOg/fGsBrn
	 TP7iKPasjJ4RL2rlCnrQ3TMkLJhQrl30NZe4Rxs3Xa7INpweNLgSkPeP6x8YSF2WOChz6
	 vFmnYO9OQv58M9T3t4yV21uY/qspSl+YKVLOy2w5z2+05eLx/ey9r+SJ9zFbFx/L3mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nMZXZySt;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE692606A321
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 19:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE692606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nMZXZySt
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b413997581so3967055a91.2
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 11:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795548142; x=1796152942; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+sqGc9BB0de+o0BtnP9Aq7Fkyx+O52AcgmtWyPr0TiA=;
        b=nMZXZySt4kKuUEuezyaFKNG+BAgUNK3SZMQ+nMKDsk8BZHIKZ2NJxetVIz2mjjCPcz
         949ZO2Du3YGV1JmJksnU4KbmvwPfm7lWkrR2UjC9vzBMOF7gcMQc7cx6wErOu8SaZvmX
         gbGeOTyv7VU39/DmRGeT4f4zq7WOcyjS71esY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795548142; x=1796152942;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+sqGc9BB0de+o0BtnP9Aq7Fkyx+O52AcgmtWyPr0TiA=;
        b=XEwVWWyhqCXPFLIiz7dnkX1SrkBwOaEhZoLw7AiS14W6pF1OAz+27JwDPXPflpZtGi
         ami4SOg6aRfMnieM8ct5wG8XUmWa0CoZiwC7CJi5q6dGWh0uOtPcanERNuZjA4LEeK2I
         DrQfOeiV5H9mC4wsmAbSa5u+Hy2XMSMDDxTA3TAs3PdGEAfVZGTqRB/+Ut+InCklYBQm
         40ab8Ct/T9aHvqbv7wdkmWq+FcJK12ceyzo2louN8X9/cMTmP10VWt2z/ryEsOUydgoN
         zGjpjKPt7hJJ0xCIIBFaRy32P93c7co5VNAnwBxCZP3FyFoFYDYnsYNl7pwhVehfrGPh
         kl4Q==
X-Gm-Message-State: APuU4Z+IG0AvkifxBVhjjOtD1blLb/OFzvSXyGCZJ35HkuiOYMferD3u
	NZIXdbyjEcF+CUnsykPfeuRxNFHvuoDjHOs7QqPVjNpN19RBrxXSlQDtmG0o7sGj3yb3iqWD+3O
	ggy9IRDhU
X-Gm-Gg: AZFdTZe11bGqrhB6EZwp2ZoJQ7NCrpkK4XGXaFuOwkEfn3255/rIQEm0e3gE7jwIMhu
	z2zydflL2wVUGvBe45itiJHPkrEmYrGkPD+OXH2xkDVhhQ/mnu0WDo7KjAhhg7US9HsyVL9ykA+
	qONZcODVTOoeDDL70lmY4Gmsj3znjtZrC88fSmpgRT5KMCSoPWEg4pIbaxc/Q24sLnbGoVx5XSN
	YwpFIpYp4vkdGJWt18cjkUTtKeq7GvEcXFmogGWSM6LMwqzFDBwee8j1V65GTZbwcsm2fA0Q1zt
	DJKC66u1yUrGJOwTvdJNlwDjwPINesfx6sY0NlkKdIqL4h8SJYvacjGcmeUJccHzsfZK/wiWGbm
	V3QOpASi0UruH7nl1XZrzKg8np1dBzOqym5Ur3A1TvSwyrcYFCbW4fDfuiTUQfFKdXXnM2CNwFz
	rhrtUJKkunEseaIkkKbvF6E0Lki+oPvvqm3izWXDjtJvFfEREKOklx226i4DqSOmkWec7I2uG+a
	2u7lcaVkJYnwu7QJUQ6A6dfbcyuEotUYxAn+iczow/rKxeatnynHVGQHcYHt9Jk7hHCsV2If1ck
	De+MyCrDswufet0VUbLcdXZz18c3rGBf+8WVcF3kqKlcQd4BGHeuDPn6BXItXmXL4w==
X-Received: by 2002:a17:90b:240f:b0:3b4:ab19:ae09 with SMTP id 98e67ed59e1d1-3b4ab19af51mr3588131a91.52.1795548142326;
        Tue, 24 Nov 2026 11:22:22 -0800 (PST)
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com. [74.125.82.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm25474832a91.3.2026.11.24.11.22.21
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 11:22:21 -0800 (PST)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15dd124bbe7so5374655c88.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 11:22:21 -0800 (PST)
X-Received: by 2002:a05:7022:b908:b0:1b5:25e:9582 with SMTP id
 a92af1059eb24-1b55691dbe2mr14081660c88.37.1795548139472; Tue, 24 Nov 2026
 11:22:19 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124100623.2227323-1-chris.bainbridge@canonical.com> <20261124100623.2227323-2-chris.bainbridge@canonical.com>
In-Reply-To: <20261124100623.2227323-2-chris.bainbridge@canonical.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 24 Nov 2026 20:22:05 +0100
X-Gmail-Original-Message-ID: <CANiDSCteP85q_nz+-_kG7+h9AkoE+uiVr4VwYHGm8Y+w8vNYKg@mail.gmail.com>
X-Gm-Features: Aa3M54qZlBqKXV6xMS8voS7QdUfU25qdUIfEGZwbhyuEty5R7NTbFgGEiEWFQUo
Message-ID: <CANiDSCteP85q_nz+-_kG7+h9AkoE+uiVr4VwYHGm8Y+w8vNYKg@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: uvcvideo: Report the failing control when
 restoring controls fails
To: Chris Bainbridge <chris.bainbridge@canonical.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Chris

On Tue, 24 Nov 2026 at 11:10, Chris Bainbridge
<chris.bainbridge@canonical.com> wrote:
>
> When uvc_ctrl_commit_entity() fails while restoring the controls after a
> USB reset_resume, the only message visible at the default loglevel is
> the generic "reset_resume error -5" from the USB core. The control that
> caused the failure and the reason for it are only visible with the
> uvcvideo trace parameter enabled (UVC_DBG_CONTROL), which makes the
> problem almost impossible to diagnose in the field.
>
> On a Logitech C270 (046d:0825, USB_QUIRK_RESET_RESUME), the processing
> unit restore fails with UVC error code 7 (Invalid Request), mapped to
> -EIO, and the user only sees "reset_resume error -5". The restore order
> suggests that WHITE_BALANCE_TEMPERATURE is written while auto white
> balance is enabled, which the device rejects.
>
> Pass the err_ctrl out parameter of uvc_ctrl_commit_entity() and report
> the name, the selector and the entity id of the failing control,
> together with the error code, using a ratelimited warning. If the
> failing control is not known, report the entity and the error code only.
>
> Also extend the "Control error %u" debug message in uvc_query_ctrl()
> with the name of the UVC error code, the name of the request, the
> selector and the unit, so that the cause of the STALL is visible in the
> trace log.
>
> Signed-off-by: Chris Bainbridge <chris.bainbridge@canonical.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c  | 36 +++++++++++++++++++++++++++++--
>  drivers/media/usb/uvc/uvc_video.c | 31 +++++++++++++++++++++++++-
>  2 files changed, 64 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index d2f722bc3459..f70fa37800a4 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -3199,6 +3199,34 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>   * Suspend/resume
>   */
>
> +/*
> + * Report a failure to restore the controls of an entity. @err_ctrl points to
> + * the control that failed, or is NULL if the failing control is not known.
> + */
> +static void uvc_ctrl_restore_error(struct uvc_device *dev,
> +                                  const struct uvc_entity *entity,
> +                                  struct uvc_control *err_ctrl, int ret)
> +{
> +       const struct uvc_control_mapping *mapping;
> +       const char *name = "Unknown Control";
> +
> +       if (!err_ctrl) {
> +               dev_warn_ratelimited(&dev->intf->dev,
> +                                    "Failed to restore controls on unit %u: %d\n",
> +                                    entity->id, ret);
> +               return;
> +       }
Unless I made a mistake there i no case where err_ctrl can be NULL.

> +
> +       mapping = list_first_entry_or_null(&err_ctrl->info.mappings,
> +                                          struct uvc_control_mapping, list);
> +       if (mapping)
> +               name = uvc_map_get_name(mapping);

can you move this into a function uvc_ctrl_get_first_mapping_name(err_ctrl)

with that move this function would be so small that it is probably a
good idea to squash it into uvc_ctrl_restore_values

> +
> +       dev_warn_ratelimited(&dev->intf->dev,
> +                            "Failed to restore control %s (selector %u on unit %u): %d\n",
> +                            name, err_ctrl->info.selector, entity->id, ret);
> +}
> +
>  /*
>   * Restore control values after resume, skipping controls that haven't been
>   * changed.
> @@ -3210,6 +3238,7 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>   */
>  int uvc_ctrl_restore_values(struct uvc_device *dev)
>  {
> +       struct uvc_control *err_ctrl;
please do err_ctrl = NULL here  and not in the loop. We probably do
not need it here either, but will make the static analyzer happy.

>         struct uvc_control *ctrl;
>         struct uvc_entity *entity;
>         unsigned int i;
> @@ -3230,9 +3259,12 @@ int uvc_ctrl_restore_values(struct uvc_device *dev)
>                         ctrl->dirty = 1;
>                 }
>
> -               ret = uvc_ctrl_commit_entity(dev, NULL, entity, 0, NULL);
> -               if (ret < 0)
> +               err_ctrl = NULL;
> +               ret = uvc_ctrl_commit_entity(dev, NULL, entity, 0, &err_ctrl);
> +               if (ret < 0) {
> +                       uvc_ctrl_restore_error(dev, entity, err_ctrl, ret);
>                         return ret;
> +               }
>         }
>
>         return 0;
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index a92a986ab714..b10064defaf4 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -68,6 +68,32 @@ static const char *uvc_query_name(u8 query)
>         }
>  }
>

Maybe you could make a function

static const char *uvc_ctrl_error_name_code(u8 error, int *code)

and reuse it in uvc_query_ctrl() it is much more nicer to get the
error name than the code

(sorry to treat you like Santa :P)

> +static const char *uvc_error_code_name(u8 error)
> +{
> +       switch (error) {
> +       case 0:
> +               return "No error";
> +       case 1:
> +               return "Not ready";
> +       case 2:
> +               return "Wrong state";
> +       case 3:
> +               return "Power";
> +       case 4:
> +               return "Out of range";
> +       case 5:
> +               return "Invalid unit";
> +       case 6:
> +               return "Invalid control";
> +       case 7:
> +               return "Invalid request";
> +       case 8:
> +               return "Invalid value within range";
> +       default:
> +               return "Unknown";
> +       }
> +}
> +
>  int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>                         u8 intfnum, u8 cs, void *data, u16 size)
>  {
> @@ -125,7 +151,10 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>                 return ret < 0 ? ret : -EPIPE;
>         }
>
> -       uvc_dbg(dev, CONTROL, "Control error %u\n", error);
> +       uvc_dbg(dev, CONTROL,
> +               "Control error %u (%s) for %s control %u on unit %u\n",
> +               error, uvc_error_code_name(error), uvc_query_name(query), cs,
> +               unit);
>
>         switch (error) {
>         case 0:
> --
> 2.53.0
>
>


-- 
Ricardo Ribalda
