Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21244FECD3
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 16:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792167389; cv=none; b=WUtSXZiWTIJOkIeII73zD+eO9OUPhCAlEzCpxGubdcsHAiptJ5FQY2bgxf2z3/6PhwIz1BqhhpK1MBPk8kWSKIwBGzYK63eGKAukbYJJdOWoVDydaHRWYSJQd4Thr4JJhx1pcyE/SQxgV0hlhbpl59PHUG64GOqAhe9EL9jElBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792167389; c=relaxed/simple;
	bh=7DHGCZatwX7FLNpiqx6l6zSz1iIXAE0Gsx9JKxioU1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pBQnHP84Z+8VuQVBGdmM9LGsxVFsiO0rzrZNdMPPOwUBivRV38ki3KmrBGfPwGSfk4Wa+aNsIS43/uAWXvySQgT66VLlVjCQ5g0/+NYbIrA9EzCO95Fpx7tFxwBopNZ3Yilk29Tq2x8lwxVP/UvSyILa7KeVsCrFQDpExz6/7I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ceTiwjUX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ceTiwjUX"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so1118105e9.3
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 09:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792167381; x=1792772181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7DHGCZatwX7FLNpiqx6l6zSz1iIXAE0Gsx9JKxioU1k=;
        b=ceTiwjUXQ8TOjcRuS1jy7GEudy2wieSR+3fN8U5c4uDIeK/skbgVstU1CHOSoeoGh3
         Y9Q72hY3UtxRukdGjUlFbJSPZqciwPFSfZxmUEXm5umscXZX0vNN+2Q/uz2aQ57WmzUv
         OlKZvzdzytjNZhtOncAmZeoPeOtXmm/QhO+dpEryUmgefRQ8SSLrupe0uGFSDXZErQTd
         CP1jaHNQ2iHz6CNSq5rLgb5akpDSYxvF+HPH/o8hStyq2j87ghOf0HTc3hF6JeDivAPV
         NQK/AuD+Vqy8soXfzt6MFA9C54JVdVXD7U0RYDxM5loBnsAE+nEOFTYc7zq0Xg+ViyYx
         XhAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792167381; x=1792772181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7DHGCZatwX7FLNpiqx6l6zSz1iIXAE0Gsx9JKxioU1k=;
        b=cTBU78cjRQUQYOF3gJayLRwMPtGNOlZLbEMhie2xV8cOIgxe7YkdThEQr3VioQKkhK
         uZVeWbdbVn/kfWTCqxwVStf/27J+qnigZYSVFxPizaAoPn3Piivxq5L6H99LLXpa00Tx
         N1Kx1F3Thm6hgZ+pii8ThAktNn7i43HWSYKF12tccxlHbvMhUwyarC+gG6I1XknMy1t+
         Q7sCf2DCM18f2X/1wS/h55UwZ/K2xjrzkc4cItbxGiPYLES3ckhswChsfJ24FTk/+k/9
         HlBW6LlUbyKFSdjwFNOBug0pkWLUur1bOgbFXeo6oQgiciNA3LU8IDwAqIH86Aapzanw
         gDYA==
X-Forwarded-Encrypted: i=1; AKwUvBzP7g0dERivuzeD//vhg6NgYSm3dRBvJ2r2SMY+yNDAY9hMVfbsm5tIFWbmb+UaL5HNxosYog7segm27A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLvAhdG6NvbaybcsgPf1FjPENDuLcCHI2p6AAamopyWrxsrxP2D
	8d5C+jfzKBeaHhSYqviBOwViLy/x6d/LOKCs9PX5UcHYkJrTl/DiRco+
X-Gm-Gg: AYBFou0uYJqouIl0xdmaudzuIdjNK5lIFFYuewCvNCL7ceVXtV3kozAcucJhT265F0G
	5Vs12ucgtWp37vX1O/wVV2ZGLWhFgyTqrVssCR3/smD6brJMj51MRYGIzQdVfWvLDKDLIJkr1+/
	4/3+rLKZkApyJ7n1YpvISTKol1MGfFdJmIVsZuc3Bcktp4srNxc9Y4YDqOilaNdlA4gmGV8G7xD
	Uet4wLp2ijI+9HbFUGsu1SnvY79vSMdfhV3hn5jyoVEkZxIEPDgueDaeEbxa2HHN6WVsFrUMOnt
	ZgG4eFOA1kB+xwYEzJoWiLuAvFec5FMFA+HIvNGOhgM5eUc8kgOl0WJu4Ys0/zQ78uqYXlsOwCP
	F6N78oCy60q+IognUPZw4RteqYK36OG6GGPZyXvF39q6scTUxmn9PHjjL4Cn1Zydah+tLmmwR7F
	PsCQXJ4nn29A1b/I3rue2YrS10hHplM58f0ed+0WUa4J4X9uqk3I+/ud5KZeAnqvoHxYifazNNR
	hftmnAlxrG/6r5KUpYI7Vq++eOJj2HmZunOXSMseImB5u1k1I00fbL4SbNu4PgpVwMNtX03
X-Received: by 2002:a05:600c:1c07:b0:4a1:8d46:6228 with SMTP id 5b1f17b1804b1-4a1d7613a0emr6883345e9.14.1792167380631;
        Fri, 16 Oct 2026 09:16:20 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d3e2e602sm32622125e9.5.2026.10.16.09.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 09:16:20 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sergey Lebedev <lsa.uz@pm.me>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	German Pablo Lindo <germanpapulindez@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: ov13858: Add device tree support
Date: Fri, 16 Oct 2026 17:16:18 +0100
Message-ID: <20261016161618.209290-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <19662dcc-4a25-4d18-a3bc-6b277bd676a6@kernel.org>
References: <20261015-ov13858-x1e-v1-0-acdd918f4fb6@gmail.com> <20261015-ov13858-x1e-v1-2-acdd918f4fb6@gmail.com> <19662dcc-4a25-4d18-a3bc-6b277bd676a6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bryan,

On 16/10/2026 17:06, Bryan O'Donoghue wrote:
> You describe regulators, clocks and resets in the yaml file which then
> don't appear to be supported in this result code ?
>
> - regulator_bulk_;
> - clock_bulk_
> - reset gpio optional
>
> I don't think this driver would survive suspend/resume.

The power handling comes from a prerequisite: this series applies on
top of Sergey's "media: i2c: ov13858: add regulator, clock and reset
GPIO handling" v3, as the cover letter says, but that is easy to miss
from 2/2 alone:
https://lore.kernel.org/all/20260831130312.26296-1-lsa.uz@pm.me/

With it, the driver gets the three supplies with
devm_regulator_bulk_get(), enables and disables the clock it already
takes with devm_v4l2_sensor_clk_get(), and takes an optional reset
GPIO. Power on and power off are the runtime PM callbacks through
DEFINE_RUNTIME_DEV_PM_OPS(), which also routes system sleep through
pm_runtime_force_suspend() and pm_runtime_force_resume(). So the binding
describes what the driver handles once both are applied. On its own,
2/2 only adds the OF match and the endpoint checks.

I cannot claim it survives system suspend on the Snapdragon model,
though. System suspend is still an open problem on the Surface Pro 11
under Linux and has not been validated, so I cannot exercise that path
here yet. What I can test is the
runtime PM path, which is where the supplies, clock and reset are
switched: the sensor powering off between sessions and back on for the
next stream. I will run repeated open, stream, close cycles and report
the result. Sergey, if suspend works on the Intel model, a suspend and
resume test there would cover the rest.

To make the dependency visible, I can carry Sergey's patch as 1/3 of
the next version, with his authorship. Sergey, would that be all right
with you, or would you rather post v4 yourself?

Thanks,
George
