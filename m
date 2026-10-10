Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5141495047
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 11:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791631889; cv=none; b=iIUCd+CBtlYe7BE90Wf/Nj8EPysmcRgGRvpddz58EywxkeCx8QdF9+Jrs1YbP/sleEAg+IqaeErTMSdOh7chyhJ6ANpUIETbjF1/QlX/kfCVmzXF5JKw6KCNjUaDQzkjR56gm2oiAIlDPXcszOgp2xghEP2y4VSfdXlRVAeia7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791631889; c=relaxed/simple;
	bh=Es+dBV7DIZIeEMX6pKpx1DQ3lWrpAte1IyrZLYZ2vJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZH/DNI8Uzm0wW/TdI/sOyvmayT4C6APskwllv/J857kipH1BUt2lO34EhT2Fs34xveF3SPfC+gMaYXjRBndNkbiNfvR+x1F3yNOjHhE51HFbWe1VJ4LixKXNkasaWFeHJMwsA6YIKCxgPlZjRFslC4vhf+lsSBXltUiYoSSYJPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZSnd7Upb; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSnd7Upb"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so5104285e9.1
        for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 04:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791631885; x=1792236685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Es+dBV7DIZIeEMX6pKpx1DQ3lWrpAte1IyrZLYZ2vJ0=;
        b=ZSnd7UpbfCXgZqmFdH7yiOsV5Op7IkwIarhwClaWT2TKvXPxl52KnmclpSBeMehD3W
         3ztxGtskF17bKD1Fgnn8kQfPEPxVzKPmBVYsu5u3Hv9JuXMSAw4kHWl9tmfBP9hgPfFq
         S3tZoD6EJVlB0aVCma7ajJW1W7kvnwOdjJQ8lQWzjtMuZqBu5xEIM+dguSRHJSNia6y9
         j/2ZGEh5tlRHcCgapyeikF8qJ0J1CXxAcGjcWJ6xHAbyqwej3pu73pNlATVuaTI27R8h
         /pFMcBjNxWQnsn/Z2wXK79BLjNZf3W150w8qpxHNG1s4PifQlmWRpFV3kG/I9Qx4eXts
         Shkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791631885; x=1792236685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Es+dBV7DIZIeEMX6pKpx1DQ3lWrpAte1IyrZLYZ2vJ0=;
        b=Gf3B823SsNfE3b3uafdssvlDqoKF0+PlRDkp93cyVz8r9QbxVDeyLXWivX/rUiX2ew
         uRwibf12RUhlfugQCAyAUMHWTQGNX9Gizx6C/8ZrkY4/YOUPucJ42an9naEFu2BWsCuj
         afEdDTNektyGNdzXMGpHWrBDw7A1TFvGtQCXpCXoN6T/anjPUAVQ1I1QOA2+5WznaTgo
         +eXLcGfQS6I+3qAfPahp+5MrQjKFo1j6m/N839CIjJ3Ndpd9KbXiCVWubQpVmPrIOhZN
         NZXAVj2Z2/+3T2h3Lb8kBMZdfjZE9xsNDw8uVQzVWkOkKFv3CPJPS8INrSMxFHJo4KmM
         5fDA==
X-Forwarded-Encrypted: i=1; AKwUvBzW3KBUNZ/i3pLZALBcB5k9ExU6KmE46jh3QHs3r9nDkwrTaOxPe+/JRKJZCxCj1bYxq08diOXOiRL7Gw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJzGe2PZ+sSwOuDKe0+AsbMeUt52PY4t7CvEgllPNDAGFopYvJE
	vhDrUiMK8u3hewom5Q5OJbX3a1f6zp4XU7QtBTkp6l/On+gvXYJ7JQoE
X-Gm-Gg: AYBFou0QzblDz5gU+86IvZp5sHGlzGgwnp1eSBeCc159e+kudPgCjv/Hf2ietBE3X3a
	pZJGhZ9dAFWVy/n9jxJGXY9zO62wQabR/uNLVT0YCC6tccILdvcy5ChI8qlAJaKySVdsXOb+oQi
	4GjFomnv4dsOCu42+TyXzeolLE4i32mGas8gyeb/AU1TbH4HCIQZEPEj26MwPUDlvO9fjtR4M+a
	Ifqw2MJgAEt9JiR4G2bG8s5X4tF72BokzmfqKlZqcNaKxhmUwvpDfbapm/VhOco6GGDYomZ99eS
	JjWVgI+MdkJ8XiD2KPkyOoankohXf7TGQUKevdaXMADsoVLS53xju8t0j3yVXcy9fZ2P1yvXeQR
	jaUTpfib1Y+d3x/jMXC6jJNjeDWgTW28x3gG8xSWPrNjyH5TZ7veDFmkhHnNw/o/peBgh4CW+3x
	wiwJvXIXThMyBbGjbcvVF3GcFnhe9stJJviYrfFaZnx/8OXKu0uWUKpaCxpqSz24bTbHkEEv5uD
	v5rQUdagI4iCGMK4FMIsicvj5XzgW9BwFUKuVwyysQTPcg=
X-Received: by 2002:a05:600c:4f46:b0:49f:cbf1:e77b with SMTP id 5b1f17b1804b1-4a18e4a5355mr105108215e9.10.1791631884527;
        Sat, 10 Oct 2026 04:31:24 -0700 (PDT)
Received: from Cachy-OS (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2e0dbsm133458045e9.11.2026.10.10.04.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 04:31:24 -0700 (PDT)
From: German Pablo Lindo <germanpapulindez@gmail.com>
To: lsa.uz@pm.me
Cc: dan.scally@ideasonboard.com,
	dev@berg.pm,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	platform-driver-x86@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	German Pablo Lindo <germanpapulindez@gmail.com>
Subject: Test for [PATCH v3] media: i2c: ov13858: add regulator, clock and reset GPIO handling
Date: Sat, 10 Oct 2026 13:30:55 +0200
Message-ID: <20261010113055.31715-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260831130312.26296-1-lsa.uz@pm.me>
References: <20260831130312.26296-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As discussed in https://lore.kernel.org/linux-media/20260913144127.17995-1-germanpapulindez@gmail.com/ this patch is necessary for the proper functioning of the camera ov13858 but not the only one needed for this camera to work

Tested-by: German Pablo Lindo <germanpapulindez@gmail.com>
