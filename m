Received: from mail-oi2-f41.google.com (mail-oi2-f41.google.com [74.125.231.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389DE3D6477
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 15:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.233
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870357; cv=pass; b=i4BI75o7o8Qzn6PQ8HgTenHK6yHGgs1IDQ6CtWPufYZjTuwYWwcxlzHLppX5f4cg+92rofx04lzO1A9H5AaVf8/AvAGmJpm+2vuaZAwZilrnyJWhC/yBN91RXnPPzKFRO9yKf76fkW42hdEMG5DOsJlrN2/eQasCz2Rq0zL0+9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870357; c=relaxed/simple;
	bh=xGRVRG3bANziLbbWfgLCs1dTAw7UUNAdO1KbQXxklMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D6/KebE+7eTcP9vYMeKjvoL8zm2foPxIaNQ52inYzKyBdHLrGOMXWem4xB9mnxVML+vam6LeSWTJ1rEcOhlvD3Ef+DcwukCsdaO+Y95qp+W+DU8wbxCJnVdkHY4ORVvQ4OtZh5WdJOfD56Fq5KYVG3cjfaIqfqebr8IUw/SwIfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=GVmnq3n0; arc=pass smtp.client-ip=74.125.231.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="GVmnq3n0"
Received: by mail-oi2-f41.google.com with SMTP id 5614622812f47-4f4a36e08f9so197667b6e.2
        for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 08:59:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790870354; cv=none;
        d=google.com; s=arc-20260327;
        b=fLeSEGAaclk0nruKHdQR8iNNH7UhxdzrudeuKgh0/q2MWUdB9oHZxGJfxczDbC4JbO
         /EA0NiEHnVBF7L0iQGvUzOMVl0lJFXqGAYp5NSLPuwKnYI5/NhszjgLBR1ZdzQczBi00
         m/Ayy4fDrkOolcEuJsJ9QWuVRix5duAwll9OD1Bq8L58JPBAKeLZqNF1AGwpW6CeVMYt
         9+3Fie31Ztni8DBiofOOq16wkpDqKNmYm8b5fxZ6bbfQMq1glF5lFVTdmn5ZZpOXHFDQ
         uJyUGdupZIEPnMPINWTqqZbmk5rl4Oq7uWjn94JO1u5Dg8aL8UMD9JjP5CHGJR+hjucJ
         7Jaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gGXBtD5i3iEOjYjdpDLSyJG8vr5d+zCegcbbH2xRJZs=;
        fh=N3QA1AUkmtA6xgTOFxyxW5+qwuwaGCuA2pogbgBD06Y=;
        b=hkWu+WEjSs625ki1HHkn0141lV0tG50hWDiVbQR7nrvl56RrUjGxtfxCIQO8zfpsXp
         ZH/S+jOGJ0ejQy0eBUrbMG8ySJjDvbmVZWDBIbj5I2+1S/I/dcBiNP4aQdGjeisTZ5E6
         VuZP4QW+qonRv1o4hvZAlgTbnRW9sRJ7+Ljy0m52k+ClNVtQvtJKuaTVYpC98xLzbmUz
         cX4LcGpsnGT7Xextv/h5kbllRIBL5AoKNmtVqEqz1OhheM2ekpbSgn7Db2qhQL1/6RHm
         egLStG6diD04Qs6StKbPznUv67XbIpZpXIcSVT5f5CLesQAppsO4fUOXlS78Z+ty9N1J
         zDAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1790870354; x=1791475154; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gGXBtD5i3iEOjYjdpDLSyJG8vr5d+zCegcbbH2xRJZs=;
        b=GVmnq3n0yltosIrzzqEj+0hfboI1DxdmygcIxnKE1OAyLWK4SGPfxzx6do5lpD2O99
         7tzsj24lXremONEgd7lGsqztCjTgJ+ql8QeFTBu1mbk53SZ3gDNdAFVbjWZ4bi3yjSI7
         U41nvGmopyWHPTG5WWsQ5FCgOghT7WSEjBAyzkutDA78ZrOzg5YfuqPpiWL/X2H+dNZR
         fO44KcV3mxsOLxWDwOTs3sN++jl2lhGW5FwUJ7TernKfYNoDvBD33eagwV0YLwkMBef7
         vsvNKoBbZhcINWh+z6qeRZAhBjtmY0+NMFwmNa2pP9iFQ9x6H+UwW9YhYqWj9WazAxgS
         0Ytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870354; x=1791475154;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gGXBtD5i3iEOjYjdpDLSyJG8vr5d+zCegcbbH2xRJZs=;
        b=N7lb/E17eUge4Bw3MiOIyGFHKMUu6b0eyBvQNU/lufJAzkG9i4dN3Fjf5xxyLhkXzL
         sSseIRCzlUpchgb1NifVkNZCPFqN/bLYCiPItW+1EIhNv48mlcpTyRqk5ydKyw97wJhI
         AaF4lkI+JKnZTi79lEOFYcDo+SSSuRRclZWHQbVhSAtdOqYPmqCS9DJDYxcTu59xirKp
         M1p/mYeSTUQ002m5DmEq7EAcJD+YCkMZt3iypFVyTCaxO/vpuAp/5Kj6T+oZRZaqo9zK
         A7OTlE4rA3vK7kDLgGLWbTdLOqk2bRsihFagR4RyXHEobp39nmVTyy9nFKQY/c8pbB8U
         0u8g==
X-Forwarded-Encrypted: i=1; AKwUvBwlCJr7Fr6aKG42mk/4kLMUaHXD8IQcwWwFyo6Sj648/Xi40bC5a2WQcCA/85nLowYURZi1ca9wcJitnA==@vger.kernel.org
X-Gm-Message-State: AFuF++kuuVTg87y5P590G9k8C+lT4Obyd3Piv6RvEy6NxcByG93SNlMi
	UgdL7Qi7ZHJftiKvPgBIR6qOf77humdZkm4pKUrh/p5NRQVYofkHVKllw+WgrCdgB1cSV8QYcc1
	V+zSuOqDHG2Us5KD43ckQBuLCu50zD84NWEJDpRYJmg==
X-Gm-Gg: AYBFou0rVtz/vwqz5xl2Orbmb2eaBo9ZAPFNQm3mGqvG5WaR8g+r/+S1V18Vg6ScuYX
	cpM6G9Ufop2ugTZvr2F2IpxjiD+Gm9Nppf+HppKSH1P+dZwe0zlXCjD56VbdD4ZN+ebTxt7NDvd
	78r7+952Mlq+s+QHNyifJO8K+kYZBUaJvkaQu7sCrgyLscTsu/PRPVVTVYawYbZpnuaGszE43bB
	2xACU+6xvbOzn58GDWqAFT5ufachOGULDQtaF5tg3tZKFZo9eiXGHVGFqb34at9yF25tTd36i4V
	KKO/W9uDWHh8QfkplOQ0pqevTrmGq5DKeCYG9J3FJPbOvf2NyxJKyaBhdCVgcGFhttL0BxKmdfx
	A/LhMIGfnNqx67akj4HNClpq06dNuyHLGpQna7K5rDoIMJ38mp/3CQ8zMiyCrGQC0g7FCIdUv
X-Received: by 2002:a05:6808:4497:b0:4e8:18ee:eb4d with SMTP id
 5614622812f47-4f1b5fcd0afmr5535366b6e.20.1790870353757; Thu, 01 Oct 2026
 08:59:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org> <20261001-v4l2-sensor-detect-v1-5-a45993be17b8@kernel.org>
In-Reply-To: <20261001-v4l2-sensor-detect-v1-5-a45993be17b8@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 1 Oct 2026 16:58:57 +0100
X-Gm-Features: AclHuK_Yf9QyrCc0iJsQd3RXKlqA6IRw77W3fZK_Zobo9ZJVh5iTB54WTG55uA4
Message-ID: <CAPY8ntCBcUXte5pAG+i0SRNC-z6GOjakfgGLjDm7D=z91A3uhg@mail.gmail.com>
Subject: Re: [PATCH RFC 5/5] media: imx219: Add status polling using .detect()
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Michael Riesch <michael.riesch@collabora.com>, Maxime Ripard <mripard@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mattij

On Thu, 1 Oct 2026 at 13:55, Mattijs Korpershoek
<mkorpershoek@kernel.org> wrote:
>
> Userspace needs to be notified when a sensor connection status
> changes (e.g. disconnected at boot, then later reconnected) so it can
> react accordingly.
>
> Add periodic polling using a delayed work that calls .detect() every
> 2s and sends a KOBJ_CHANGE uevent with HOTPLUG=1 on status changes.
> This mirrors the approach used by DRM connectors in output_poll_execute().

AIUI DRM polls from within the framework (drm_probe_helper.c), not by
a workqueue in the individual drivers.

Admittedly V4L2 doesn't currently have a totally obvious place to
setup this, but it would be far less effort to have the polling
framework within the core code rather than driver.
Possibly initialised in __v4l2_async_register_subdev_sensor() based on
whether .detect is set, and cleaned up in
v4l2_async_unregister_subdev, with the workqueue calling .detect and
generating the udev event based on the return value? I think that's
feasible.

  Dave

> Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
> ---
>  drivers/media/i2c/imx219.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index e198d3fe99c6..76e578a8eab5 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -20,6 +20,7 @@
>  #include <linux/i2c.h>
>  #include <linux/minmax.h>
>  #include <linux/module.h>
> +#include <linux/workqueue.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>
> @@ -374,6 +375,9 @@ struct imx219 {
>
>         /* Two or Four lanes */
>         u8 lanes;
> +
> +       struct delayed_work detect_work;
> +       enum v4l2_subdev_connected_status_whence detect_status;
>  };
>
>  static inline struct imx219 *to_imx219(struct v4l2_subdev *_sd)
> @@ -1252,6 +1256,35 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
>         return ret;
>  }
>
> +#define IMX219_DETECT_INTERVAL_MS 2000
> +static void imx219_detect_work(struct work_struct *work)
> +{
> +       struct imx219 *imx219 = container_of(work, struct imx219,
> +                                            detect_work.work);
> +       struct v4l2_subdev_connected_status status = {};
> +
> +       /*
> +        * All async notifiers should have been run before
> +        * we can use sd.devnode
> +        */
> +       if (!imx219->sd.devnode)
> +               goto reschedule_detect_work;
> +
> +       imx219_detect(&imx219->sd, &status);
> +
> +       if (status.status != imx219->detect_status) {
> +               struct device *dev = &imx219->sd.devnode->dev;
> +               char *envp[] = { "HOTPLUG=1", NULL };
> +
> +               imx219->detect_status = status.status;
> +               kobject_uevent_env(&dev->kobj, KOBJ_CHANGE, envp);
> +       }
> +
> +reschedule_detect_work:
> +       schedule_delayed_work(&imx219->detect_work,
> +                             msecs_to_jiffies(IMX219_DETECT_INTERVAL_MS));
> +}
> +
>  static int imx219_probe(struct i2c_client *client)
>  {
>         struct device *dev = &client->dev;
> @@ -1334,6 +1367,11 @@ static int imx219_probe(struct i2c_client *client)
>         pm_runtime_set_autosuspend_delay(dev, 1000);
>         pm_runtime_use_autosuspend(dev);
>
> +       imx219->detect_status = V4L2_SUBDEV_STATUS_UNKNOWN;
> +       INIT_DELAYED_WORK(&imx219->detect_work, imx219_detect_work);
> +       schedule_delayed_work(&imx219->detect_work,
> +                             msecs_to_jiffies(IMX219_DETECT_INTERVAL_MS));
> +
>         return 0;
>
>  error_subdev_cleanup:
> @@ -1355,6 +1393,8 @@ static void imx219_remove(struct i2c_client *client)
>         struct v4l2_subdev *sd = i2c_get_clientdata(client);
>         struct imx219 *imx219 = to_imx219(sd);
>
> +       cancel_delayed_work_sync(&imx219->detect_work);
> +
>         v4l2_async_unregister_subdev(sd);
>         v4l2_subdev_cleanup(sd);
>         media_entity_cleanup(&sd->entity);
>
> --
> 2.55.0
>
