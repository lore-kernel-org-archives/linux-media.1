Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156CA4A2617
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 18:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788288930; cv=pass; b=UuR4rwooTrxj96/AhEpk6RZvYcTTfsRuGNr1PFpX2ykZAbCH8q8OuDtcTcZZUafF/npor+PtYTp/CqnGX5RClTfteYEP8d0VaXxTb1qR6+OLOvPayS9ncHoni7f/0aCS82vjhyhomNFQeD8b6h1GkUTzYCGY9W4clE2hbTDRtBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788288930; c=relaxed/simple;
	bh=ErHO/v0ROpELW5A1Raz+ryY+dtx1QI0IBK81suK6/ZU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=NPpLvWG5OGybvhuaLdujQPYXvZ6TsZ8J3iVeBeMCyCLNe4ycaAPGVVzj6+GyVJkLYZJbmNyVdhEsoENcpODz0EH+JATki+G6+IMQGqepkTFcqbleGe0p6EeJW/690AbHkJyv80F4i3TtEl1fvyPqmneo9lSm6mOZ3G79L3G2nO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OFiPxPdC; arc=pass smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OFiPxPdC"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso195033a12.0
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 11:55:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788288928; cv=none;
        d=google.com; s=arc-20260327;
        b=I/aH6fMpHU8Z0gyoMv7pBQBA0PwJQQqFnvdnlyHQI+locXIZnepZB4CIL5av9Bq4dp
         bQMGG7Iq5qiIgaTtNZtgsv/pyeXqnLFpsTO9gkPcj/v97njK/yE/4uw5rDuu2t1gGYt4
         asdTwZQ7C5ULgdUqJ99jMe43iT9IP533Cuc5N+5R3UpJwk5XwmXQZSbq4KjADinxHID7
         kyjceeR9xg+Zq3nnZJUpa1JjOCYAtKUuGB4IBhKRSiwfQjJEYoeQtUTyvO03q25FdTge
         zddrNndhAJ4bXHA53TKaVp+/gDF3QT3h2/vAa4Jjc7na/DgQOgh80cG010IC+/+FlwPg
         5KDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=nxE3PGolTbb10HX/XollRxz2M4ecYtyre/o2ctViDic=;
        fh=6x8D0mD/W+4MkMEedyCDQkfBwJquQwki4eeW8FVipFQ=;
        b=m1jTwG9yolHwMe6KCw5EZi8u8dof2BW5Ae8C2PqNqKviC7E0rl2YLoHvPur2n6nUKo
         Xc8QIrIsAOGISutPgz/wmLryPJWVbUEs6Ffi5gnO8GdjqrrWwnXAHEmY3MY7C344+rBb
         xD49mo5cfKS4C7jQZMAh7dqwhIqZZ2H+pf4uBrzzghjPG5HpI93QTq4gKouXx584/1Lm
         bdfaAaI543biqc9AeH85vKtHudaqJipCpRMgGQ1H6mBAjAfMxZuWem56kB5EL57wZ0eG
         tVvYvJA4xCujh2S/6Os5VsWBjyWSmfo3xhou1+GTPE9I/QGHjJeuisWZUkjY/J/kLrwN
         23IA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788288928; x=1788893728; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nxE3PGolTbb10HX/XollRxz2M4ecYtyre/o2ctViDic=;
        b=OFiPxPdCMG9VVxjYZxBINywmNALfP3pkyVcZCcKOEYdnMiSfZNhwYC7b7GUaS4g24v
         00vnP3BRr2t1PR11zXpVbNbxd5crglRNl+E6KYr8xadJwXtDRSb3ncwNNp8QaPS7eTj8
         CJhLqYZMgbVX/KIINIY+w71jKaThySveXp1FUqlI20TjcQL7wHYnZ+33MtwCGUL7Hvm4
         ttfUvMFR0RcLE55FjzjihTP4ZXKVugR1g/Fy6OowWRcbQJrmkkqA5upG16o0A7E5wYAL
         FT372p7VjJhjOYyfoQ+blN6UzgpqMPagIOTjhLIGYxcbRrW4qUK+azYSjziFjBDG3+SZ
         S4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788288928; x=1788893728;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nxE3PGolTbb10HX/XollRxz2M4ecYtyre/o2ctViDic=;
        b=eSBo4ZIlW6WBe8WzU6rL4gypcCIC5Z2uCc3U8SKcGUDXF1QxRgootApjlWWuAsRB0h
         E8tpaGWaxQilMAuqdsOgyC6Dn9cLRFM3QXGWYBtfz1qBEnu4wMb4ATVJZBhfm1DMumQp
         WDY8ZjwCQAJmPeZh8mDMKQHNFQUch6XL+iHvRizHpQS6skP9E0mwzNdY4UcQgQbdZPj5
         vLRnt7zdP/3sQnuVkRMxmWSBI4ZQAbA5+mO2Vb9DQYczeJF4jdNdeqX6/HA0r9yekv6g
         Q7vWh4yQMpWqnWKegh0Cpk6RNVqrv3beg4vJPM0YG84LfLDlrZSOcRSEH6shU4lFWS35
         LKYw==
X-Forwarded-Encrypted: i=1; AKwUvBxq0ZvBCwfiuBfaFyjEhkdM2/gLhnq0AbhgVbVEMAc3R2DbvTREa6qESC8vXPPZIsS+KstUhYSI4I0Zgg==@vger.kernel.org
X-Gm-Message-State: AFuF++m+CyUz0CJ47z7XaDJBnB+0cuq5929hjm2zA3Of+xjaAAmTMT5t
	oc+0Q/g8Argl2r3BB2OowrCA+z/qlxXApur0mktVSVgZg54hpiztRRT3vFj6rS1wBIDV10HHJbP
	8KpEdO7PaiIWuLvax/9KdpNrpoZQlGzc=
X-Gm-Gg: AYBFou2lBPF/IIJntABGTx5DB8TGxWIodpCg/YZTpNmJLGp5q0GIj9jp/bgOK6GrRjP
	bCiXgfXx2/cU9hysabywg/rhVO/HWY3TYgt4qHRnvX05TkJvOgAipQww4Mek/KQWxsoRq2bfMnD
	JEMNfZuI4JoCTA0bhSftKlAebRzHNCRD0bW6sUVGRdCzgna0PptJI+xxFZDQlH4Zm0aaI2Ql7uq
	C6zhWOVVwNB2QLrHl2cpDoxuyErSxESAN/a3ihky9kTDpe3prc/wzIkvzw06+L7i0wAT9zS/Ed0
	T1/kRmyddeP/m/WZxwsECk3g3qvorOKmlnEvcRvKdplw6L8aodKpJWD/VPXOp+qC6L9IY5xF8zK
	DFxt7ACNziKWgEAsc5wyzK7N13P1F0FY2bYqjOq20risEM+sRTKNyqOrOv1+b7bOgyorEhafFdw
	DpKPBhTHMxocp/csmO
X-Received: by 2002:a17:90b:3c05:b0:381:cef1:11ac with SMTP id
 98e67ed59e1d1-39ae82c833fmr237250a91.10.1788288928196; Tue, 01 Sep 2026
 11:55:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Raphael <zanarelli.dev@gmail.com>
Date: Tue, 1 Sep 2026 15:55:16 -0300
X-Gm-Features: AcwNN1WuJRLfQdGSa-3p8s9a665DC0XaB7WJ5wguH6OtylKYxXqXiC6_1oCOcO8
Message-ID: <CALVpWBsXgOYSeTH6omxbfcwfrEg0kEv=cQ+Z8nRjksFBvHaSaw@mail.gmail.com>
Subject: [PATCH] media: staging: max96712: fix cleanup in remove and error paths
To: niklas.soderlund@ragnatech.se
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When max96712_v4l2_register() succeeds in finalizing subdev
    initialization, v4l2_subdev_cleanup(), media_entity_cleanup(), and
    v4l2_ctrl_handler_free() must be called during error unwinding and
    driver removal to prevent resource leaks. Also pass the array directly
    instead of address-of array in max96712_write_bulk_value().

    Signed-off-by: Raphael Zanarelli <zanarelli.dev@gmail.com>
    ---
     drivers/staging/media/max96712/max96712.c | 18 +++++++++++++-----
     1 file changed, 13 insertions(+), 5 deletions(-)

    diff --git a/drivers/staging/media/max96712/max96712.c
b/drivers/staging/media/max96712/max96712.c
    index 0751b2e04..852a1a7a3 100644
    --- a/drivers/staging/media/max96712/max96712.c
    +++ b/drivers/staging/media/max96712/max96712.c
    @@ -92,7 +92,7 @@ static int max96712_write_bulk_value(struct
max96712_priv *priv,
         for (i = 1; i <= val_count; i++)
             values[i - 1] = (val >> ((val_count - i) * 8)) & 0xff;

    -    return max96712_write_bulk(priv, reg, &values, val_count);
    +    return max96712_write_bulk(priv, reg, values, val_count);
     }

     static void max96712_reset(struct max96712_priv *priv)
    @@ -329,23 +329,28 @@ static int max96712_v4l2_register(struct
max96712_priv *priv)
         priv->pads[0].flags = MEDIA_PAD_FL_SOURCE;
         ret = media_entity_pads_init(&priv->sd.entity, 1, priv->pads);
         if (ret)
    -        goto error;
    +        goto err_ctrl;

         v4l2_set_subdevdata(&priv->sd, priv);

         priv->sd.state_lock = priv->ctrl_handler.lock;
         ret = v4l2_subdev_init_finalize(&priv->sd);
         if (ret)
    -        goto error;
    +        goto err_entity;

         if (ret < 0) {
         ret = v4l2_async_register_subdev(&priv->sd);
             dev_err(&priv->client->dev, "Unable to register subdevice\n");
    -        goto error;
    +        goto err_subdev;
         }

         return 0;
    -error:
    +
    +err_subdev:
    +    v4l2_subdev_cleanup(&priv->sd);
    +err_entity:
    +    media_entity_cleanup(&priv->sd.entity);
    +err_ctrl:
         v4l2_ctrl_handler_free(&priv->ctrl_handler);

         return ret;
    @@ -451,6 +456,9 @@ static void max96712_remove(struct i2c_client *client)
         struct max96712_priv *priv = container_of(sd, struct
max96712_priv, sd);

         v4l2_async_unregister_subdev(&priv->sd);
    +    v4l2_subdev_cleanup(&priv->sd);
    +    media_entity_cleanup(&priv->sd.entity);
    +    v4l2_ctrl_handler_free(&priv->ctrl_handler);

         gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
     }
    --
    2.50.1 (Apple Git-155)
