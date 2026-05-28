Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0295D2E7370
	for <linux-media@vger.kernel.org>; Thu, 28 May 2026 15:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779981530; cv=none; b=UoZwxDzRbX5Bp3Dm5f7Ofe3o314LxgZyHTPvef7mWCSkuWOCF6Gxp4PeWDc9TPLVxUXaeWMlNAesAdcRUIMp+CKHAD4c6JZAx+v4NfzHx0nJqDMk/CeSmVGsXoPwgqi3RMS3HfXQFDHc3+Q131NSy4jXBM8cAT4Wr5TRv/sHiQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779981530; c=relaxed/simple;
	bh=ZQ+ke9MsNzZ/oiRaHJn2Mb2UdBbOJ5eOlXoqF3chMoM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Rmlm9saG73aKKAbJhDhlykIXRgxKQrX9syDOvOF55Lxxxmcramlni0xzUa2HGEDxY9XHNXrb4gDQDG+DhoZ0GyKQorC9WaQqjvjdZgZoZXFLDpmUM7UrwigqanRrPNh0or7LVGij1RYD5eqfDP77Ez2MuuXeaca+gHWiBi//Qiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y58ahWPD; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y58ahWPD"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bd2d8bb1068so2366452566b.1
        for <linux-media@vger.kernel.org>; Thu, 28 May 2026 08:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779981528; x=1780586328; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/nojM8rV21V1Lo/5Vp0lHNgK6K9mG5UBxn30B82BFD0=;
        b=Y58ahWPD+wxNT6KL5lh/an1w+gEsfP/WrBsvHtT1JQwhToG8RR5RQVjTwSGzLure+r
         DuMqP9RAJW66D3g96TjK13oCShyrh0Zv1iFPjrjsxPXYe+j5Uk/zSlZ9CN7lwJ7ebS7x
         UkZ71H37akOZaqme13amJBPbHTNWHYXYoTx50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779981528; x=1780586328;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/nojM8rV21V1Lo/5Vp0lHNgK6K9mG5UBxn30B82BFD0=;
        b=mfOB7MBuOe1+J20wtqkWYBLpX1OoChKaRWnXoyX0ceYcDIG66xnV6zEmPCkcfOZ8F7
         GLjr33s4MMhLWAWRm69ND8psQMQyY5YRw/PvQLHxFylRTCksjK6vC5t8dLtuQgvGoV56
         xmt52Fk7L/5SS0QpqpYm9cumja+OxVbvUUL8wtihBg9J/48aXQIi57GDeUb2a4utP2g1
         YXDDg+R+wCEb4Dj8SYBSykDiwu/97qkXznCT284pPgjRkYlsQyMww8dI8g8JBbA7Gv9O
         qeyEzBjX7GrHdWI9J3dyhw++GR99hJ8peHDRyEO0F7DoJQhzkGGvLxc6GYt9ncWp5ZVZ
         3SNQ==
X-Gm-Message-State: AOJu0YyrtPgso0t/7tj3+yimkPMhbwCQtkqxKP0+cBH7cbMuwNPtEEtM
	TRHzKFpXoXwXEB3mBry2igfAYFw3Yewj/lFHXwXRK4zlCOWU+l7TgB6kqAnrN9WeIaPCpzM3xHE
	cOOkGKw==
X-Gm-Gg: Acq92OGmAhEZCRxKRnmOhQS04eKSsPt1IIXyDEgdmWpSB+yRamwgZjiAl8dw6PnRrH/
	YaVd6W7e3gsFfVbn92Tm3ULBY2tlE3VVIX/oH5q7jkT45EZTW9me9blOGZAtb2X8oOT2kVeh5Bw
	TyrA6h3F+7YE1AN0YW6spsVFceOwX8CYMsGVsm6hlF7Y8iC/KzQvyoszYfjn4bZLg4HKeCjExfT
	3dXGzgpVfK1Xm5lz05Lrk+kY9s2CR6/stGaMEVObcU08ZexVWWnEKy/7rc04GfuBMDjvfQwyHqQ
	kfcqoXBdb7Ws+MkVIWdvv9dYB8xLzTzTqbPEkmodZJ/JiShkwQdz1MRatHY5esjc2F+PX4m+cki
	e8g7XypxOKEbmcY/LeKN8SmuuTyIhAsCgKZubc96r8t14aB55SGNo2vQIZsrJ0H56mis7PlBeHR
	KF1ous+RArfZzf+3F8bRjPugmZJewcPX7bdf6Ds9uG4nQ++yzAkLmuWNO09ryoWpgDI3Q4T3k=
X-Received: by 2002:a17:907:26cc:b0:bd5:7c2:70ca with SMTP id a640c23a62f3a-bdd281aafd2mr1889075866b.48.1779981130987;
        Thu, 28 May 2026 08:12:10 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc5ed2d38sm736214466b.34.2026.05.28.08.12.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 08:12:10 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-67389cf78b0so9873798a12.2
        for <linux-media@vger.kernel.org>; Thu, 28 May 2026 08:12:10 -0700 (PDT)
X-Received: by 2002:a17:907:26cc:b0:bd5:7c2:70ca with SMTP id
 a640c23a62f3a-bdd281aafd2mr1889066866b.48.1779981129027; Thu, 28 May 2026
 08:12:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 28 May 2026 17:11:56 +0200
X-Gmail-Original-Message-ID: <CANiDSCunFkyGqz5n15ezW0LHCHqU92g6xeVK43zRcqohS-QsdQ@mail.gmail.com>
X-Gm-Features: AVHnY4IOFP7prKqEj8JPPnzo-871cHky1NWimhCw5SN0FQv5Rg-0paAFA4XtLc4
Message-ID: <CANiDSCunFkyGqz5n15ezW0LHCHqU92g6xeVK43zRcqohS-QsdQ@mail.gmail.com>
Subject: Adding Linux-media to Sashiko
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi

As we discussed in the media summit, I just created the Pull request
to add linux-media to Sashiko.

https://github.com/sashiko-dev/sashiko/pull/224

Please let me know if something does not work as expected

Regards!!!

-- 
Ricardo Ribalda
