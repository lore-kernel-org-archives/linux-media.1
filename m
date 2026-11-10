Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794311882;
	b=5UHYR+QjCBzZNlRAsCyDb4yqXqBO6NMBG2YAhUocjzKZeZt9Yzgc82xpeZZ6SqEFWOoj
	 XKonKrLJ4ZcOalq80RsLF0UssyrfgmO6BDMQX85uayaxLgo6Q09jGDDAVwfDAXedWK0fN
	 9xwAYcPXF6AYTxoyfqYK+e3L3/VMOXJovsAjlwwnZAZvwriXRvVyw2BlpqrvfDLWJk4m+
	 JymYJqLE2b9I2+JkEjMgNZkOWySrL2qiAxEcjhD1wa6Wgt5wBinhw4Tb5ZPd443NfM6qk
	 l91QMpY3dG5xglH1Ssy2Cth4bj0PjoG/eS1nkR08kKVF83xK5/2aoU1kybnRiTqRtnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=NtZdO6nOLG1xCmYrcxMOJxxZ01jNgWBM1JEvDfWm2HM=;
	b=2hXCVsZCZYllgMvguMVl50VrT99usU17v9PacHjvxRU5g7+Cujc/zmSa47snO7uf8Mas
	 +uexzBZ2ah4suxO6VqUJDx9gR1uHfRqRjR7uqnlqyQU5QCJFJ12Cy1JgtNB+jk+ck6rVk
	 QTCv2WLzdoIbXKrouGd2K+QXsxyCR4gQ224Ju8YcsGdLycVmyjzrJ91+9wpLFzFndQZEX
	 bJBgMKHUtsGjIWVLnQCGUGi05ADr3OGbRtK1stUMHnCx63uAgv5FIBHXjoN1MMWQY1MV2
	 tlDl6CsUklI5u3nptIQ95r/wMtTV9O2TFqYJ2ZHrTeMRzZgA/wC2MCTt+qEkwxN4/Ng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RPx4PYCo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E458D606A33A
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 11:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E458D606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RPx4PYCo
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6774639a8a4so1835665d50.0
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 03:58:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794311880; cv=none;
        d=google.com; s=arc-20260327;
        b=D1H4LbMnOeMCGIVjwB5/26L7zelnrqED8VeDeQUKkYScxzT6zrsSCojtqWEbhImhd2
         Y/O/U2/0a2XelOuwc+qNQyMrF9I99/1phgMb5J6GS0feXC6DGXstYVHv/zgcJ6d+1z4k
         TYxAYEVtIpDJ06OacPDnAis+aKCZBe8JMKncQ9AbyHI7qItPO6JlHmN363/4fzW3hm7x
         LQ8uC34+VkDOMBIjVBlNGQDxb5NnneK4l3PpedhJfdYCj0RmjcRcILpR9VF0guO1TpJY
         Ane55Hv725uxUyJIgny2qio5UakVmUWrxGzUZ1RT6p/EGMDJuWyayJnsNxfEtXUo/SC8
         fiMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=NtZdO6nOLG1xCmYrcxMOJxxZ01jNgWBM1JEvDfWm2HM=;
        fh=Fe+pmnSLOcdnWDqn1D3Jneadm/h658csylS3JULTDII=;
        b=G9SdaNQc0o33iPvVGLAUxjaqiaA30po7EwGzpl9iCXMLRaNILOY/hgU9cH2img2T8Y
         Ow8HY0nzgLXLtzhivV/IKjeNFjBrjM4+YlMxSJ4XX3+d/piE6+rwGN4SwYqBHzlUvSw8
         T5Klc+H4VtrI/6lMoPIw4GrxQleiq/gpUY+TYKnggRqhqD4o9vWIQRHHk4NKC+J+PLxH
         Y5V5QqyYUyTnmEDXmakdNCS3n6mi/ndfFGrWf1ewENoLNT2o2ndZr+11qKcqSD6yAVDU
         EKYpprHDXPnDtodkdGEPEz1bPf8o6cbF96itfVyiFyX1hr3UL538Zmt4AsJliBNVvyXe
         vnCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794311880; x=1794916680; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NtZdO6nOLG1xCmYrcxMOJxxZ01jNgWBM1JEvDfWm2HM=;
        b=RPx4PYCo+eQDGb6sDAICjWjaCPe0dhtI4Z6JcpQz1JiMCy86nu+iiC4IQPcXoWjYz+
         6xFkQR8JrSzzlg9TNoBSqgIBs41KlhNJ6PKsA4DqahjoHidcFnKRS600vBbgAkPsBbGB
         y0auxKikS9dguD4RpK/1lVJuE3ujbXkln6DqhZbCCu9dIF10VUFLRHQD5zcgXqmwNtLG
         322hNoaqUECQRVVYX9VgH4VsEfBLo43Xn2T1HsXhLazGOcDp3WMDxJMTb8fyUKRkVGtN
         W2VRHl9GWoR2HHS8ppVP6P4PT5cZen3Uc6meTl65pofsgp7OmboTp71W0mqjjOEWPbY/
         o9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794311880; x=1794916680;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NtZdO6nOLG1xCmYrcxMOJxxZ01jNgWBM1JEvDfWm2HM=;
        b=XxET6moTDKtYfCy4VvO9cPKP9RM+LXQcWqxFFmq3cskJDnyE0IjlH7m+9F5jzqHpl3
         3AeQx1XAzUC67EKu2Vf2w3fyWtsqjQg5+7qaFlCgfFczVNO7GJtq5yEXvaCZbI7LNGwv
         AnEX9jvDU5YDWNbVZa6BKENn7eQqN5+5POcr7shRm0hoBTQjFusbsWZj49ydX5xopVy8
         LpxlA/qDQTRW7D24ggb2YVnii7NzPXNuz37v2uvmP/zdgJVmgIaReIcSm9lz5aCKzqpe
         pCNQc/Xz+vKcnIEAl4zZRtV807bw4mmKXCq/M9vdS1Ashx47dSe1vwCeBgpuyfg8TlRP
         OM2Q==
X-Forwarded-Encrypted: i=1; AL+hErEksdzSjB1SzumR6R3RsxrbBiioOy4mjVTHc9H3BxypOhKBuiYf8LKYRXjmcy5i8cCiuKEdlIV78m7WJA==@vger.kernel.org
X-Gm-Message-State: APuU4Z82FDpbsx9utndtZJjtulCDQSNYuTTesrqxPHCXsvLeM1E5OmMA
	e+QNhXoO33LwZ6WFkitPSfrQslROJP/xCBHQmDju6Pr5oC4Es/VoD5OhXD5m5zsUO9l0/m9lSqk
	wYaaPmBODYhk+6olAAjy9+mtZcQzjMoM=
X-Gm-Gg: AYBFou1L/Er5L+F2Wrt1fWBTUiRO6VLydYip0xaHJHDAGgfFBwacLL/UA9yKNbyZ1MC
	TMPO9ibmwNa5GJae0Zi98XS0sApk5d/hwQbOf/bjAs+DFJpMj/wpe7Ugq5BvuGAdjSoQtK93Var
	Myk1WEy/mutUuIo5JxdSI/ww0DN87gFJfp2Hs1DkuchNtNkWDkV69gtNcAuPyOqbSzBfJrYxBt+
	oisUjDYqOW4we+DGCT7ecHzm42KTKm+Ek9GyFCMuKZeHkr5KsmbvY5oErXJBltzfsdIKd3FYlFU
	3au0gTaoXl5qVYBVDSblwIiRENoOHbibrEn0zpE+oHIg/4rFfQC+KDr1ZdBmIysbNl/vi5lXsOh
	ZH4yBQHnK6iXRkPLhz9HROLxD5CC4VNeVzAt3feqLbWkOTPDb8SbilQ==
X-Received: by 2002:a05:690c:dc6:b0:8b0:f0cc:db0e with SMTP id
 00721157ae682-8b392c3d7b0mr12234627b3.78.1794311880452; Tue, 10 Nov 2026
 03:58:00 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: =?UTF-8?Q?Kincses_Benj=C3=A1min?= <kincses.benjamin2007@gmail.com>
Date: Tue, 10 Nov 2026 12:57:49 +0100
X-Gm-Features: AclHuK-790e-YG3XMXcbn9JCn1hGEUSurN1poH3-rodvAOagUfzcQKHK3R5q3Ng
Message-ID: <CAB9ndWsADtrZNFLafOoO7qAdgWncBbKbBkLVv4P8b6jyTwx4qw@mail.gmail.com>
Subject: [PATCH] staging: media: atomisp: fix spelling in hmm_bo log messages
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Three hmm_bo log messages misspell the past tense of 'bind'.
Fix them to use 'bound', as listed in scripts/spelling.txt.
Only string literals are changed; no functional change.

Signed-off-by: Benjamin Kincses <kincses.benjamin2007@gmail.com>
---
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 0a8f401..1fc5c1e 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -448,7 +448,7 @@ void hmm_bo_release(struct hmm_buffer_object *bo)
        }

        if (bo->status & HMM_BO_BINDED) {
-               dev_warn(atomisp_dev, "the bo is still binded, unbind
it first...\n");
+               dev_warn(atomisp_dev, "the bo is still bound, unbind
it first...\n");
                hmm_bo_unbind(bo);
        }

@@ -830,7 +830,7 @@ int hmm_bo_bind(struct hmm_buffer_object *bo)

 status_err2:
        mutex_unlock(&bo->mutex);
-       dev_err(atomisp_dev, "buffer object already binded.\n");
+       dev_err(atomisp_dev, "buffer object already bound.\n");
        return -EINVAL;
 status_err1:
        mutex_unlock(&bo->mutex);
@@ -882,7 +882,7 @@ void hmm_bo_unbind(struct hmm_buffer_object *bo)
 status_err:
        mutex_unlock(&bo->mutex);
        dev_err(atomisp_dev,
-               "buffer vm or page not allocated or not binded yet.\n");
+               "buffer vm or page not allocated or not bound yet.\n");
 }

 int hmm_bo_binded(struct hmm_buffer_object *bo)
