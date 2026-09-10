Received: from mail-qv2-f11.google.com (mail-qv2-f11.google.com [74.125.230.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8134A49A0
	for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 14:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050436; cv=pass; b=ABqwO5Ca4/6CD787ii8a08rqvSt5zbIlz66lrlm9myqph8sVEGUHKvLiHJKdyOlP+6NOhqfpTnPEoFVy8wBRUlNNqjSknx7abaFCGdOqBbyJmTxFfftnHBx3dUM8vOGt1TkUW0PzliRKMgr9YXsFSqH51/6kXs9bFUWUhvLp9UM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050436; c=relaxed/simple;
	bh=XFUFazfuIMQ64hRY9FwhIfv1FUgZ4NvEXMyfvgwl6Ks=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=i+3X/LXTtxto9CGsEpWP3kRSdmwzuHoVshYCSeqkzK6vbsWlI0n1rlwzhqIlZ3lzQBVbcPNGExoSmhXO/Bvo924ewse9GwUan0ijBru9gwaWAcLQC0aj8vaS6Ux8Rz7bgT+Bt04G5u96fjhFLBDzj/BnkpshSHf3UqWRX72TYAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J9O8MTi0; arc=pass smtp.client-ip=74.125.230.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J9O8MTi0"
Received: by mail-qv2-f11.google.com with SMTP id 6a1803df08f44-91041f4a0dfso12371776d6.0
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 07:27:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789050433; cv=none;
        d=google.com; s=arc-20260327;
        b=ACbnMJVPt76nlOfyhAKrAaBpdYD3k5HqvJjNNb50JB1gIHjr7ISuSwwLYAMa5Ho5YL
         3fCBndLVk56QB6cizybMBT7kZJCuhMhcqPXXUMF0U8GH0rt/aVUf+Vja+qzROgY29bQT
         hKXpsv/NtnZMl5gfiWmOBbTg21OPaQHEUyEHF6q9x2Xk0Bv9q2qG74FXBmXGX/XofLyt
         89O+S79tHSPJJ1WAJspwMARm0R4G81uS1bDz5FeAYAa/MPclGH+wepW4X3c9AuaZwopT
         Ot6lnJsVsD7ppH/S1hk+2jlGjW2N7Sp4qGOxFmrNdfcCkRWBaZk2Ig6tpNhvkBZxAFNt
         FanA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=OYzPALwbkpEJNy0Fg9Fok6IzjwexhNaARMkyqte3Eow=;
        fh=NgaTrv+jl2HyW43UZ/M51d2xwIxZv4832gPUm+WmDJU=;
        b=fpo1YVBV2/lP6cH25V/iEO1D/HX2o8qQoOIetY2MElGqkJPYccl5OPHOOvuTKnIo2H
         KuiYEJS6xX9SgAhXfv3gcGlVh5GakdxMqQpiLn/ocJhy3GDMMKspDgo9SHBuBfaCxHsk
         We9QkGRY7Xx2QpA79JmIDIs/AKlJQqy3+l0AZ740D3+OumD9X0wwNzCSl3X+6VvX1d/E
         LwAifkxcWqdfmzuYgIO+QJVarwzIcG1EDgYi4BzZ7y+zRvP9NgFoNSBuHe/SsjFiBCK/
         c9Od7yJUX3qaxDxxXIucYNHYyyO59Ix0Y1RZVzhwX5wtHubwOxKwx2u5FZn+GdVoRdw0
         twGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789050433; x=1789655233; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OYzPALwbkpEJNy0Fg9Fok6IzjwexhNaARMkyqte3Eow=;
        b=J9O8MTi0woVNoOAZdV26REOvKbFFx/YFkGKAP260++XR2HweQ/35AXzA2HkiFAPjQI
         fvpcaNl43CdYxfQkY+4puMg4UBuCUg6MbMY1Hwiv0pZLoFQKwilKpvIC1F1wxSvQX32F
         1+ScEiE0tXEbOED9spP8CXxPfTUWN9nvP7HNhDqdG3Z4BqbXn5p7Oh2uieRKDMfJTPto
         twHNpRKIUmpySqYv+5YWcnsPpsVNrKrPmDHqHTYneUh73hRaUbXWDv2sY1UrmHT4S2so
         G+We7zctjNX89c2Yc7ctP5FXLTN27ibey+5RjqWEVr4UrYlUHDLQu1DFa6ryGGtKFUeH
         26ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789050433; x=1789655233;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYzPALwbkpEJNy0Fg9Fok6IzjwexhNaARMkyqte3Eow=;
        b=AKT1fCs4+z5ONSHv77j9n3fNJZulI4tK5F61CQPvSi47VKhoB+ob3pP0U7qn+vcBVP
         kkbPSixqtAvi2oi/0MR/EPeomtmNYQeQbNRNP/+/dEm10E9i6CuUbrfJVe/bogooVnwy
         NuWn3HPOxnIWx64t6TZ/nPHZNlhn7T6KLY9+Dk7vQw2STAWVendxSz2Uognyy2c7KMEd
         Gavlqo3Xmq0UaRi4hsaEIBYyhpeM0vVt/RhjaBN6TQMr9jBkILMLgqIJqorm2kdrVELF
         3F93tWkfrXlZFFgdC2tnfJVSjY3Ud/OsqAR57ur9/HemNoiKaUhwcYDV4Yw73Kx16WJX
         Zymw==
X-Gm-Message-State: AFuF++mGvCyY0OXV5rcK0d4NjJbVrF5fhOzk935KOAZ08XcuZfPpr0wh
	MYbkHkNSTbFqAfOc8TJrb4Don5y9nOVsARygt2GPOPfWE61id8VKM4cQKVC7vfLg/yGqcz6iTbP
	rUe6cphZicnTEejwpyt9rc4eqCnSeuY8=
X-Gm-Gg: AYBFou1ibFPEVMcVhZAk3lzBomS0MXNgUYKv1YVLl1r/95IMWkCU38q9qHwVdsIH05I
	NxNN96/fkOi0RHGDOmMohoMHLCRmOGuDSlnGJpmU0hwV+1qOr8N7XE3ofTeco0o2x+lySLhjF8S
	n1aZi1pOb/zxSwqkbuh8Xux/dP520Yv+kXlMBpbgpfBC5q6IYcSYpGD0YaH1dsx0BADWa1oMbcr
	ifCIbpqHaTPElW/TeG0K94S1Q3WYv6Uulkr2/audqIyY2eL9mrACqyFiLK7JYG4PekVDAmdEwxa
	IB0WN67F5fCl456Gi4PCVZBjUDwdet8tMRfCO/6VclIe0gAmHmJci9ybX+HbkKB4vnYqJKUm9Ky
	FmqKuBk6Pfbhr3vw0H5C/Cs6+NA8qbaAaPbDHTVi3pp4cf856+6h+y6o27nIJxo6xGMW1
X-Received: by 2002:a05:6214:3286:b0:910:3451:343 with SMTP id
 6a1803df08f44-9103efc9b37mr581362186d6.34.1789050432428; Thu, 10 Sep 2026
 07:27:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: www.rokinthanp03@gmail.com
From: Rokinthan p <rokinthanp03@gmail.com>
Date: Thu, 10 Sep 2026 19:56:56 +0530
X-Gm-Features: AcwNN1X3UnoP8H6Z6eWKfUNDNvz-s_6kgXnqM_hKUbLJ0lQsk-0h86K8BJvN2XI
Message-ID: <CAHzb5FF62brMQkynL3oCoxA_XtiF3n00h7kVzJ=EDWJOGVLojg@mail.gmail.com>
Subject: [PATCH v2] media: hackrf: defer v4l2_ctrl_auto_cluster() until after
 error check
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cf896de36144391bcde1@syzkaller.appspotmail.com, 
	syzbot+9f7405999979761b6cfc@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

In hackrf_probe(), v4l2_ctrl_auto_cluster() is called immediately after
    allocating the auto and manual bandwidth controls for both the receiver
    and transmitter.

    If allocating the master control (dev->rx_bandwidth_auto or
    dev->tx_bandwidth_auto) fails, e.g. due to memory allocation failure,
    the pointer is NULL and the error is recorded in the control handler.
    Calling v4l2_ctrl_auto_cluster() with a NULL master control causes
    v4l2_ctrl_cluster() to trigger a WARNING:

      ncontrols == 0 || controls[0] == NULL
      WARNING: drivers/media/v4l2-core/v4l2-ctrls-core.c:2525 at
  v4l2_ctrl_cluster

    Fix this by moving the v4l2_ctrl_auto_cluster() invocations down after
    checking dev->rx_ctrl_handler.error and dev->tx_ctrl_handler.error.
    If control allocation fails, probe cleanly aborts with an error without
    attempting to cluster NULL controls.

    Fixes: 969ec1f6bd92 ("[media] hackrf: HackRF SDR driver")
    Reported-by: syzbot+cf896de36144391bcde1@syzkaller.appspotmail.com
    Closes: https://syzkaller.appspot.com/bug?extid=cf896de36144391bcde1
    Signed-off-by: Rohinthan <rokinthanp03@gmail.com>
    ---
    v1 -> v2:
    - Correct the Fixes tag commit hash and title to match git history
    - Fix email formatting and whitespace

     drivers/media/usb/hackrf/hackrf.c | 4 ++--
     1 file changed, 2 insertions(+), 2 deletions(-)

    diff --git a/drivers/media/usb/hackrf/hackrf.c
  b/drivers/media/usb/hackrf/hackrf.c
    --- a/drivers/media/usb/hackrf/hackrf.c
    +++ b/drivers/media/usb/hackrf/hackrf.c
    @@ -1427,7 +1427,6 @@ static int hackrf_probe(struct usb_interface *intf,
         dev->rx_bandwidth = v4l2_ctrl_new_std(&dev->rx_ctrl_handler,
             &hackrf_ctrl_ops_rx, V4L2_CID_RF_TUNER_BANDWIDTH,
             1750000, 28000000, 50000, 1750000);
    -    v4l2_ctrl_auto_cluster(2, &dev->rx_bandwidth_auto, 0, false);
         dev->rx_rf_gain = v4l2_ctrl_new_std(&dev->rx_ctrl_handler,
             &hackrf_ctrl_ops_rx, V4L2_CID_RF_TUNER_RF_GAIN, 0, 12,
12, 0);
         dev->rx_lna_gain = v4l2_ctrl_new_std(&dev->rx_ctrl_handler,
    @@ -1439,6 +1438,7 @@ static int hackrf_probe(struct usb_interface *intf,
             dev_err(dev->dev, "Could not initialize controls\n");
             goto err_v4l2_ctrl_handler_free_rx;
         }
    +    v4l2_ctrl_auto_cluster(2, &dev->rx_bandwidth_auto, 0, false);
         v4l2_ctrl_grab(dev->rx_rf_gain, !hackrf_enable_rf_gain_ctrl);
         v4l2_ctrl_handler_setup(&dev->rx_ctrl_handler);

    @@ -1450,7 +1450,6 @@ static int hackrf_probe(struct usb_interface *intf,
         dev->tx_bandwidth = v4l2_ctrl_new_std(&dev->tx_ctrl_handler,
             &hackrf_ctrl_ops_tx, V4L2_CID_RF_TUNER_BANDWIDTH,
             1750000, 28000000, 50000, 1750000);
    -    v4l2_ctrl_auto_cluster(2, &dev->tx_bandwidth_auto, 0, false);
         dev->tx_lna_gain = v4l2_ctrl_new_std(&dev->tx_ctrl_handler,
             &hackrf_ctrl_ops_tx, V4L2_CID_RF_TUNER_LNA_GAIN, 0, 47,
1, 0);
         dev->tx_rf_gain = v4l2_ctrl_new_std(&dev->tx_ctrl_handler,
    @@ -1460,6 +1459,7 @@ static int hackrf_probe(struct usb_interface *intf,
             dev_err(dev->dev, "Could not initialize controls\n");
             goto err_v4l2_ctrl_handler_free_tx;
         }
    +    v4l2_ctrl_auto_cluster(2, &dev->tx_bandwidth_auto, 0, false);
         v4l2_ctrl_grab(dev->tx_rf_gain, !hackrf_enable_rf_gain_ctrl);
         v4l2_ctrl_handler_setup(&dev->tx_ctrl_handler);
