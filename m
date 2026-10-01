Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DCC3EE1C5
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 17:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790875586; cv=pass; b=UIYRpnDhPIq6QC+XlL+9QLlbbJRYsTOZfF+AOySxpV1trDGZkvhu3utnbX1ya0OVFRjpFu8iLZhOrUTjmWKv0+A7VazJMepQBrLnsQum95iEiLe3fTfthjcMpo2WirVe/BaA3PkaNN3itkijiIdnvEukep4ECKBCuClm5aK0zEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790875586; c=relaxed/simple;
	bh=3CJUxrL3kW030JoHEX5HubkolpDZz0bB0OuESBTT/Wk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a447BSDn9DtRjRdkXfaY/FM8J38oIyTbPoazCPXdf8ubEg8mlC7zr2vr1nYUBs/oIdOCSAp6kePhoijYT1PzglGLApO5XYJVeR9w/swt/Yjju2OFr8TmNDXlgTpUWeDIPL5cwY1TAJo24hV3swqV79ggr+aIcnx3y5JhBv6J2/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=JADdcFWA; arc=pass smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="JADdcFWA"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-47c57070c52so1224871fac.0
        for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 10:26:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790875584; cv=none;
        d=google.com; s=arc-20260327;
        b=fs89bIyufSDMueAKeru4X6PMQB1I1ET4d9JAkY4gt+EX2aLRVDLKWCiMSz3xMqOjZH
         X6vC4BNXfs/5+srY3zi3OVX64twJny/tv4/pj0S/jqEDrKVr7VTT3NMYSrr+tFyZAhlh
         7ru5+FP9fQCO8TEaBXi+HIxext/0hcq4XcQccHVVlv4YqkdWqGX8J9rWciXp9fxpUByl
         2oQmm20BLd6PFznlbeLbusCMKyWnYO7BxwMdlxnAB35zt/YimAiuw9FwqegelMAHwtxy
         uBPxdch9o6FGZRLnKWC7GMu6QTQnkjNMJRCZ8Y8IOF7tb+uweM2Imq+dqiFOJnsaPQWq
         ARdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R+7f1WEXi7Dnz/u+SCwV0uCtWUYjG5PzPuRb4pUkzq8=;
        fh=4BJzZCPdk1LZzFYEfGKb32XWE4allqlZr9qZgIy6sOY=;
        b=jJ0PljDjiHOjJwVfVxUJJPtrUVH8gNwLfOmBY3mirLW5SUmJT5CPeo7pYaxYW/KcPt
         2gNwd/U3nXOa8kflZfVZzKQW1oQlyHZcs10Goo5v1JSqG4z5qLmsX15OYcEwMGeilqc8
         6W7t5H7LlhAeMmiQMQv/NvlW2OOTDOQups269eCRlhlgj8mvqrYJ/aYjDXFKeX8udkKI
         2w/ONyxwt+fzlVzw5VYdN9LSDmyEaw4hHJYxmE97wx0PX3I8NrxVlviG7HzSfd7kOrHU
         QXROmN+BlVb/G7fIf0jiwBLjyg+5vaK2QwRtvhQcrgFt6HE7oRpbfZ3G+Z2ek30MtGEZ
         ftdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1790875584; x=1791480384; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R+7f1WEXi7Dnz/u+SCwV0uCtWUYjG5PzPuRb4pUkzq8=;
        b=JADdcFWAq1HyCyEc+xI9C4ktpBrnzyRgaRgVu1+97kG0gz/NoQlUp2lI9lLFu7wklf
         QfQ2Qq/Ihr9ait0wY9JkaHNe2/exa6QbztLp1FgbVSJaLxw67xBVJ6RdZsuqvXRTwlzL
         4zor5wdA7QMWthi9C3OaNtSjmw6xqYlt8AZp4KEFWtDzDeV+TkUjCRrpAdstWVqYui+K
         GhLaj2TgZsjNzPMEurOz+O2zUykYhbzQRXfYE5DsV5EGdznGF+wd4zjOVvJEDQL7H2bm
         6PQmWB2OdAFnkzXFxbWWqKXECQ6vUKevQXnMibW7s9OOxH3RfzM7ttJ2i2+hYuj2KUoY
         pkFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790875584; x=1791480384;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R+7f1WEXi7Dnz/u+SCwV0uCtWUYjG5PzPuRb4pUkzq8=;
        b=goiXYayZBEIDGr8jsbH+pw/B5jBRV3WeHMOdnU3WIDhTF6RZmnmHBx177NkpE45via
         XQ3/YpFovmOu5taRAfPuviOGZsFJO0lqVTJEoYpaLRBMfQAPotzi7VuA2eHSb6LZQSZ4
         Tl9tTOZshr8OozFrGQe9OyZtJQO6TWF2dszpgYkH6tQgG8FScWmDss+Bjuibvf63IAqK
         4BMTbpwdgr7WscTidn1zOlOjbS4xylLOJrEQVyYFwBI8k6tBLIA/Iu9vstgj5MhFtLow
         6Osf9sUD0VdoSW4m2L3vSShbjCsTitp6mmgVRVXW3D3IH+cDNPypy3PTIZyP1VlD3lDv
         xuDw==
X-Forwarded-Encrypted: i=1; AKwUvBzDl/OhR/jnBSWYP5T5l1LxtKTnSzzVyyBD/DHuFpejHioqhL5ouPsAbx2S7kBogWMsREVw+eIgYQO64w==@vger.kernel.org
X-Gm-Message-State: AFuF++m4HfD+CgWzfS40ZNEBfouXtpKT4+f89JT4DREOHOzxc8jNjcgy
	nbUfCznmPCUkt0fGSdOOKLc3A36yK4ybXxmMeuZeMLB/3Z1N1yuZO3dZasOemrCS8YNk5/d/f+M
	ZPlDZI4ORWq4Pi1po80iHZ38fjPI4ITk9FiSk76k+Yg==
X-Gm-Gg: AYBFou2nXFr7z2s2akPvrNSE7K4iaBtce1LoVLbKiZt0VI7/0Xq0nUU/tEv9tHwWPha
	sdQGzgAYWQobOQBiU+hSpUdHuL8osVoi/YKl0ICMyQPVSjVWv1+bzX0N7XoJ2lKmmTDuzindq8j
	VOs7UL7tHXrNP+4gwWxGVpXEIzU+Q6thDBymQbz+gkC+AO0ltqjdZg8CRCGY/N2kfqlApfWrR0u
	dCBQ3mPWb5JMhqKATjjA3+x8YTk3OZ4jklohpQIuDBEIZ5qO+YaLqVF+Isbwop8/ldoVuf/FOsy
	O/3EPzHdENi/B5OzwNf6OkOqQTnZYjn/CaUGQkroiuK4T5zxTsdBdxPMOvQWkGLYGh9g7QNTTeh
	1LoxCEsPX8SC/6JUVxkghUVus9E7/x89CebZVWzpVuGKM4wOsH/TpKirtfSkvc2sogz8PP4Mt
X-Received: by 2002:a05:6870:17a3:b0:48f:e0f6:bfea with SMTP id
 586e51a60fabf-49e15e4be7dmr131030fac.22.1790875583606; Thu, 01 Oct 2026
 10:26:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org>
 <20261001-v4l2-sensor-detect-v1-5-a45993be17b8@kernel.org> <CAPY8ntCBcUXte5pAG+i0SRNC-z6GOjakfgGLjDm7D=z91A3uhg@mail.gmail.com>
In-Reply-To: <CAPY8ntCBcUXte5pAG+i0SRNC-z6GOjakfgGLjDm7D=z91A3uhg@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 1 Oct 2026 18:26:07 +0100
X-Gm-Features: AclHuK9xdYo1ENtvCe2bDvlA21YMpzjkK_sVOz108ZEs_aVAzZPVifHLAuU6otM
Message-ID: <CAPY8ntC_4UWjR3hPG7E3ORaO_WaDaK9iiGoghcmwkmN3H0qmUQ@mail.gmail.com>
Subject: Re: [PATCH RFC 5/5] media: imx219: Add status polling using .detect()
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Michael Riesch <michael.riesch@collabora.com>, Maxime Ripard <mripard@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Oct 2026 at 16:58, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Mattij
>
> On Thu, 1 Oct 2026 at 13:55, Mattijs Korpershoek
> <mkorpershoek@kernel.org> wrote:
> >
> > Userspace needs to be notified when a sensor connection status
> > changes (e.g. disconnected at boot, then later reconnected) so it can
> > react accordingly.
> >
> > Add periodic polling using a delayed work that calls .detect() every
> > 2s and sends a KOBJ_CHANGE uevent with HOTPLUG=1 on status changes.
> > This mirrors the approach used by DRM connectors in output_poll_execute().
>
> AIUI DRM polls from within the framework (drm_probe_helper.c), not by
> a workqueue in the individual drivers.
>
> Admittedly V4L2 doesn't currently have a totally obvious place to
> setup this, but it would be far less effort to have the polling
> framework within the core code rather than driver.
> Possibly initialised in __v4l2_async_register_subdev_sensor() based on
> whether .detect is set, and cleaned up in
> v4l2_async_unregister_subdev, with the workqueue calling .detect and
> generating the udev event based on the return value? I think that's
> feasible.

2 followup thoughts:

1 - This rather defeats pm_runtime_autosuspend.
The sensor will be powering up and down for every detect call, which
may or may not be within the autosuspend time. A grep for
pm_runtime_set_autosuspend_delay in the current tree gives mainly 1
second, but video-i2c uses 2 seconds, and vd55g1 uses 4 seconds.
If the regulator has a startup delay defined, it'll be slowing down
your polling.

DRM hotplug polling is at 10 second intervals.
Assuming that enable_streaming triggering power_on reports the error,
then your application always has to handle that failure mode, so a
larger poll interval isn't a big issue.

2 - if the sensor has a privacy LED connected to the power rail, it'll
be blinking away with every poll. We've already got folks worrying
about that blink during probe, but it's now become 100 times worse.
This polling process likely needs to be opt-in based on use-case,
either through some configuration parameter, or possibly by the first
call to VIDIOC_SUBDEV_G_CONNECTION_STATUS starting the process.

  Dave

>   Dave
>
> > Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
> > ---
> >  drivers/media/i2c/imx219.c | 40 ++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 40 insertions(+)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index e198d3fe99c6..76e578a8eab5 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -20,6 +20,7 @@
> >  #include <linux/i2c.h>
> >  #include <linux/minmax.h>
> >  #include <linux/module.h>
> > +#include <linux/workqueue.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/regulator/consumer.h>
> >
> > @@ -374,6 +375,9 @@ struct imx219 {
> >
> >         /* Two or Four lanes */
> >         u8 lanes;
> > +
> > +       struct delayed_work detect_work;
> > +       enum v4l2_subdev_connected_status_whence detect_status;
> >  };
> >
> >  static inline struct imx219 *to_imx219(struct v4l2_subdev *_sd)
> > @@ -1252,6 +1256,35 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
> >         return ret;
> >  }
> >
> > +#define IMX219_DETECT_INTERVAL_MS 2000
> > +static void imx219_detect_work(struct work_struct *work)
> > +{
> > +       struct imx219 *imx219 = container_of(work, struct imx219,
> > +                                            detect_work.work);
> > +       struct v4l2_subdev_connected_status status = {};
> > +
> > +       /*
> > +        * All async notifiers should have been run before
> > +        * we can use sd.devnode
> > +        */
> > +       if (!imx219->sd.devnode)
> > +               goto reschedule_detect_work;
> > +
> > +       imx219_detect(&imx219->sd, &status);
> > +
> > +       if (status.status != imx219->detect_status) {
> > +               struct device *dev = &imx219->sd.devnode->dev;
> > +               char *envp[] = { "HOTPLUG=1", NULL };
> > +
> > +               imx219->detect_status = status.status;
> > +               kobject_uevent_env(&dev->kobj, KOBJ_CHANGE, envp);
> > +       }
> > +
> > +reschedule_detect_work:
> > +       schedule_delayed_work(&imx219->detect_work,
> > +                             msecs_to_jiffies(IMX219_DETECT_INTERVAL_MS));
> > +}
> > +
> >  static int imx219_probe(struct i2c_client *client)
> >  {
> >         struct device *dev = &client->dev;
> > @@ -1334,6 +1367,11 @@ static int imx219_probe(struct i2c_client *client)
> >         pm_runtime_set_autosuspend_delay(dev, 1000);
> >         pm_runtime_use_autosuspend(dev);
> >
> > +       imx219->detect_status = V4L2_SUBDEV_STATUS_UNKNOWN;
> > +       INIT_DELAYED_WORK(&imx219->detect_work, imx219_detect_work);
> > +       schedule_delayed_work(&imx219->detect_work,
> > +                             msecs_to_jiffies(IMX219_DETECT_INTERVAL_MS));
> > +
> >         return 0;
> >
> >  error_subdev_cleanup:
> > @@ -1355,6 +1393,8 @@ static void imx219_remove(struct i2c_client *client)
> >         struct v4l2_subdev *sd = i2c_get_clientdata(client);
> >         struct imx219 *imx219 = to_imx219(sd);
> >
> > +       cancel_delayed_work_sync(&imx219->detect_work);
> > +
> >         v4l2_async_unregister_subdev(sd);
> >         v4l2_subdev_cleanup(sd);
> >         media_entity_cleanup(&sd->entity);
> >
> > --
> > 2.55.0
> >
