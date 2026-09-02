Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A6B2C11E4
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 04:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788324212; cv=none; b=u3DA2TCA/8nNyQdDtqUlfwyOXii1szXGebgSQO5tZTEYt75zUEHPalyE7eHmHzVmgTBwBpljeXduguKezTL1E4I7C1g7+BAiqlgm23yGsXRxBBUBsK2PyRtMUXAYMc/ThndHxa24UU4FmhdsM6a6eegytcrbs25QcgA1Yvfqbzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788324212; c=relaxed/simple;
	bh=vmjPCbl9psCKc3HZTLwHjvvdx5EbgDRY4XPYqXYfqo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kL3bIX0YhpJMJaXgTuahiTZtZd15wnpiCGtPpNn+ea2AEKUPVMF99ajJ2DZqaddjBg6uM0XnRpWteUCv7eHBwLxMOXg5PQNtjIWby3TL9jPNin8NY7IpTihtzwfmzIt8RrmLwo3ukYhDVikhWGAFwPi+nYNZU7AKcB6jib9WxRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=czB4B2is; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="czB4B2is"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so753887a91.2
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 21:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788324210; x=1788929010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B5j9z3BaZXyER+IRMOOmV7jFL2VSSw846Fx/zWgL7f8=;
        b=czB4B2isFJrwl/fiEZRMrbyLEOLH8xxMMPHeWVE7lNFQQHhgfM6zPnv6TWmx7KKFLk
         3tKSnO8m38Wv1gjlIY3e0vQFWXhJpyL6uogawvyz93R5fu9jsn0TDdeBPyXcHpbRx1t7
         bKe3ZCmARozTyWJQ8Espj+LspQ/Fwtw1Qe58M8+fS5IQ3I5Mu5bR/7JgGZp0fsASfiBk
         dbCHvxRBz7r8n7mqsOQjpBweDEZwmqzP7J2aMrrXQtbxdt/P7XQ4QIzCZuqIa3hPR7U7
         k63ct+hVqMyc4N9x3QFayg0/ij/UDciVldswrgjNQk1NmBpAPf9JvTP0/BaMeSVf44rW
         4Igg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788324210; x=1788929010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B5j9z3BaZXyER+IRMOOmV7jFL2VSSw846Fx/zWgL7f8=;
        b=naYoIKx/bvmATI8/YrUV8JIYVtG2rkmuzI212GeMvELmj7dOsaMxoQUccf8CHVEwCA
         R52UHim7o6SU+RbxSHFmyqkPfoWAseapMjxDcex80HEFUbUt5i50JlobYAnMb7GimSng
         jekpn7ZTRc13GCKaR9U7ZrZqeYJxfQJB8oHVkozyuyhPb0JrcmaqfS0oAqhT8sBEAKkx
         Q6e6+uKcsTw5dypvOxysNUsPfLZOX4LdsU8ZE6fRshtfT4NK8gr/nqLjjfXULQFSBHyk
         rDPgdcb3EufpuGgc4Q9+M8UB6B6+7IXvh2bp+5fpy7Rha0nq1ChurNIfUV8hJ30BKDxO
         qnDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEn91W84PY6l/fl3cOHRRCUKRdGZKEHVG+qYXUF9GLDzJFpPM8JPW9B2aVREWkasxvsK2fvrOW6rdu1A==@vger.kernel.org
X-Gm-Message-State: AFuF++lh5IWgCXQuXoVa0HBld66qhEGtav1BV4YrMEmts8XMLKq4tZG5
	vr5Mzg9o7iGR8PyHMTBV0mLQX5bze73s7SciE5GUTxrQ9lf1YnpP91ne
X-Gm-Gg: AYBFou1CRsHRZYxPoAv8Q/UYfg1UQ05c5yMzBzpLNeVGZDPbqDosG269uB7Gkn79ras
	gV41pstOUct/L5X7A4ygH2ULSOFiPJ21kj/2WImo/0OulkpwIm0M+ooZC1kmtNJvdYqg0YOVQ8N
	2audtUtZZjGuRw51GDKdRGEfE21N4qbv8vD68+RCu7pj3zGyQkFW7TugVKCAVRYZjpQPLlk2pSn
	5pUSvc7aKhU8zgpKE+5P4LGhdDeYgHDHKSRdQOyuokiT+EeZ2L0qRZLBWRJAcFst1eR4hgPZvBl
	aYK9SDfSYZahWEMgHHCXogFreDJ8aPfiJPprtUac2tN/H5jWtPwoBTmSU6MPaqRdDrUibBVMrJj
	eokqZ5zhuByFwVtNlmvYZqOSrhVrVoJV3fejRkYUG+1cKSkJ0hVddNSkk6POOFv/Q5iiZiJHjSB
	SefbEmCTBFsa6QAM6ebXoRi+Pl+cd2SUo6iE7cinL25iWVGqohSFErwtDSrUUhGdVP/1j7892Uz
	ZrSqrdgHsQkaPtl5Y4=
X-Received: by 2002:a17:90a:da83:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-39aedfb8f16mr3355664a91.9.1788324210349;
        Tue, 01 Sep 2026 21:43:30 -0700 (PDT)
Received: from ko-Surface-Go-4 (sp49-97-27-89.msc.spmode.ne.jp. [49.97.27.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae60b48a8sm648235a91.0.2026.09.01.21.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 21:43:30 -0700 (PDT)
From: Kengo Oki <dev.kengo.fugu0141@gmail.com>
To: fernandorimoli11@gmail.com
Cc: dan.scally@ideasonboard.com,
	dev@berg.pm,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	naeemarsalan@gmail.com,
	sakari.ailus@linux.intel.com,
	Kengo Oki <dev.kengo.fugu0141@gmail.com>
Subject: Re: [PATCH v4 6/6] media: ipu-bridge: Request non-continuous clock for ov5693 on IPU6
Date: Wed,  2 Sep 2026 13:42:38 +0900
Message-ID: <20260902044238.13648-1-dev.kengo.fugu0141@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831181858.325109-7-fernandorimoli11@gmail.com>
References: <20260831181858.325109-7-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Fernando,

I completed the Surface Go 4 A/B test for the proposed Alder Lake-N entry.

Test system:

* Microsoft Surface Go 4
* IPU6: 8086:462e (Alder Lake-N)
* Front sensor: OV5693
* Sensor enumeration: INT33BE:00
* Kernel: Ubuntu 7.0.0-30-generic

I tested the v4 semantics as a minimal backport to Ubuntu 7.0.0-30.30. Patch 2 needed a small semantic backport because Ubuntu's sensor table differs from the upstream base.

Without the ADL-N INT33BE match, after a cold boot the first deliberate front-camera capture produced:

```
requested_frames=300
frame_count=0
exit_code=124
```

with:

```
intel_ipu6_isys.isys intel_ipu6.isys.40: stream stop time out
intel_ipu6_isys.isys intel_ipu6.isys.40: stream close time out
```

I then added only:

```
IPU_SENSOR_CONFIG_MATCH_FL("INT33BE",
                           PCI_DEVICE_ID_INTEL_IPU6EP_ADLN,
                           CSI2_CLK_NONCONTINUOUS, 1, 419200000),
```

After a full power-off and cold boot, with no earlier IPU6 stream activity in that boot, the same 300-frame test produced:

```
requested_frames=300
frame_count=300
exit_code=0
last sequence=000299
~28.64 fps
```

There were no relevant stream/CSI timeout or error messages during the successful run.

So on this Surface Go 4 the A/B result is:

```
v4 without ADL-N match: 0/300, timeout
v4 with ADL-N match:    300/300, success
```

This unit enumerates the OV5693 as INT33BE:00, not OVTI5693.

Full test/build evidence:
https://github.com/Fugu0141/Surface-Go4-IPU6-camera-linux/blob/main/tests/2026-09-01-ov5693-v4-adln/RESULT.md

For v5 with the ADL-N entry added:

Tested-by: Kengo Oki <dev.kengo.fugu0141@gmail.com> # Surface Go 4, IPU6 Alder Lake-N 8086:462e
