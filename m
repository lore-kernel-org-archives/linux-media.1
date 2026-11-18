Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034032;
	b=Anq2UnN2MJNE1Qv+pzUYZi50BC/K6E38F5cJYXjDxfjgYYkGSSAlNElm3robkZl+ePbc
	 fEfpKMsgVpDsS2ASQ0sgn1R88IHrf8susylHDV+yRx7pioFpk3NWB9mkce1R3/DfkNJax
	 vhq5huzM9l5yQ4vxJYy9R8uTs6kHC958j1EZ6hFP3HJgun1JwxciFZP6IrkSGbiO7K2pj
	 c0w2WggVOb0zLF1kGHE50ixzHYE6GqoP9n13m0wyW2TXf3atncHAKPo9fxVXrz6ziMeOD
	 m6H0D7iNtfAgfmyD9RsC/8aVg8Arn788DVWzREuuktcu+j2JsQVobcz/KPnUiYRkqbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YixFM3AWmT7jYQ+cnCQNR8AFTxM/A/eG60HgEXpPHIc=;
	b=x3oN86zCGtSzOiQLSXtycUfYNZkgiQIAXfZbng9sk2L43XzBVmWyU19DqWNTzSK4LAEL
	 ZeLRYVUeddOpWkxbFio5ZAh7mecFiGvUPYlG7yg0e6miJSC7PE4SsHto/Im8eH3pQowTN
	 IdncpHYp2IGsn0DR6k3LyrIla+LwQJVxV0z03VBXJYAJAfAN35QxIPdI/fQ/O5wySOkBR
	 d6eZ3E+VBo/+f5BBWkC1UsN+mHP80C6RmXMkxfiXTGxBYxCxqNlFpj1T1kNaZk0S+dsPG
	 K0qR5PT8AxKcRUz33mjJiRxgmWb/tkkKA9e/aFtc3KbxOB0r4eSw0VZWYzM2VirxYrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SdeYvXpp;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDDA606A331
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 20:33:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FDDA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SdeYvXpp
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b0b133f64fso169271a91.3
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 12:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795034032; x=1795638832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YixFM3AWmT7jYQ+cnCQNR8AFTxM/A/eG60HgEXpPHIc=;
        b=SdeYvXpp56R4ul5QKNG4I3bv+SPxvJ0N58DAwJndFM1VpQhDjNVbfbePbxmfqqKBES
         nycAcDh9RCojUL3SHvR/e0D5lY4SzWesFk/WJEO4PPgfhqwFnvk57edEpa2aQTjvPh3z
         xfTMDr2oYR4hx2BIs09zz7jOWNJumWiuCRapOXe1u+QRYlEpX2/EyLweKOAB7Xp8zF03
         ih1GkUUublMA8fuzyxaxHPLnoJF5sXzKSjfWqOwnDGSpxLs1f76wy30kSQvBVEzSkfj4
         28NRXwkdEeK4YVfFTaU+UCcI85rrqg+qxgANGXNfF/iJAftVJYGiu7QQleghksgpGG/R
         r8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034032; x=1795638832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YixFM3AWmT7jYQ+cnCQNR8AFTxM/A/eG60HgEXpPHIc=;
        b=AvGpYitnc2Fn7nwciqbNPQ+vJfStddRQyfj9KXwyzkVicASo1kS4/URvJVHl/98st1
         5+jR/4fOtIcD16zUaILYc6HkqFMfarStLZYA1uT4ai4KX6JJw5z51TOYWjsiNNv8tqHx
         jpga9oVK7Tg9ipKx23KjpNyC2ncd3ZqGKZDd9X0Ejtc3numR2EKBYEWkpcqqvpjktt8V
         mm+3WMrjId/cVYz85kZTb2ZTrO0lo10yAZEixG1f2KonvrGlwZ+P1uvIrPfP7By9znHn
         BP/Qg0z/Dr9bkhaSer6xSjgji+Ptvx2PkLcqz8qqDOr9U1VySus20dtECFcFoD2mF5AL
         c7Cg==
X-Forwarded-Encrypted: i=1; AL+hErG/68Ftpgv6i9cQt4QWZ0k6QvPiaPMNirirOIYwjA88bo6r6rVw1NmbfOh1fd15zz6Gk2HmtnQa5gQfmg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9bnCQ7mzuZdRzV4q3Psgjq2GcyxYxbQdAF51s3AxreqfaDoL4G
	Mz4gkVEYWwmnsMOD4GKFXDqODHYxukGqpN1v7f7L8gyrlSxOTH4krIod
X-Gm-Gg: AZFdTZd0gi03twj4MUvTIY172+pic0lW9Ts6KWIlf6Butmf1zt0wAi10XGvb+sxEhvB
	T+e+MsZGWezNEOHbwGgZjWgKvndl+dBjhJv8SZcWJJOsdMoefQsBNUCVpHdKnnRUCaPdjhfF61o
	SStx3QZ5KORKbdMkiCatuDG0JE7Z0HWFKA/SehEykWlrHRHk5uW5YAAvCPccVFFC/c1Ilz0S/ii
	Dwgvx8nyFA7y4MTyPmWsK1fv26Wh+xsITc3ID8oLv6WWvnWho4SvpCUVahUhb28HgDRKldSVLCU
	7Z/F+Udd+sDycdFrha0wU/BlnkG9oS7MSW25kdN1C/BS8WEGl7p1YMrwPeFi3muW7K0xrQngGIY
	7SuWuHm7io6R27Fzk7ergNS1zut9dGNMTejXbMY+xVAR2FODJSuJfROI23e3KDNvnaj1a/M7nRZ
	yTvC4BLhJ4LezuNw6MSy9oNUABHCb20LjqKw1FtuPCVCSi2ozKlrt5tsS9U/+v+q6a9qI4EAAGJ
	HkQjG82WZEL4SaXO23eUWLJ+L5iKV5Kaq1tPX7LhKIgrHzeOdmRCWo1jU4A1e+n3wM1dzboEZFw
	OzuaFcx5Z5RfGaiSAGCer3PS1wM2M5cf98I31gUQG7ii7579JjwGW24jEgbXnw==
X-Received: by 2002:a17:902:e888:b0:2ed:29a5:782d with SMTP id d9443c01a7336-2eff72e15f0mr59296815ad.2.1795034031819;
        Wed, 18 Nov 2026 12:33:51 -0800 (PST)
Received: from FAIZEL-KB.. ([2001:569:52f5:4b00:cfaf:4885:b023:6316])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2eff6116331sm19166825ad.22.2026.11.18.12.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:33:51 -0800 (PST)
From: Faizel K B <faizel.kb@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	libcamera-devel@lists.libcamera.org,
	Robert Mader <robert.mader@collabora.com>,
	Faizel K B <faizel.kb@gmail.com>
Subject: [PATCH v2 1/2] media: rockchip: rkcif: Filter enumerated formats by media bus code
Date: Wed, 18 Nov 2026 13:31:33 -0700
Message-ID: <20261118203134.315591-2-faizel.kb@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118203134.315591-1-faizel.kb@gmail.com>
References: <20261118203134.315591-1-faizel.kb@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VIDIOC_ENUM_FMT ignores the mbus_code field and returns all formats,
although the video devices set V4L2_CAP_IO_MC. Return only the formats
that match the requested media bus code. The DVP output formats have no
media bus code, so they are still all returned.

Otherwise userspace can pick a pixel format that doesn't match the
media bus format, and then interprets the captured data in the wrong
format.

Signed-off-by: Faizel K B <faizel.kb@gmail.com>
---
 .../platform/rockchip/rkcif/rkcif-stream.c     | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
index 3130d420ad55..b117ba57bc75 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
@@ -395,13 +395,23 @@ static int rkcif_stream_enum_formats(struct file *file, void *priv,
 				     struct v4l2_fmtdesc *f)
 {
 	struct rkcif_stream *stream = video_drvdata(file);
+	const struct rkcif_output_fmt *fmt;
+	unsigned int i, n = 0;
 
-	if (f->index >= stream->out_fmts_num)
-		return -EINVAL;
+	for (i = 0; i < stream->out_fmts_num; i++) {
+		fmt = &stream->out_fmts[i];
 
-	f->pixelformat = stream->out_fmts[f->index].fourcc;
+		if (f->mbus_code && fmt->mbus_code &&
+		    fmt->mbus_code != f->mbus_code)
+			continue;
 
-	return 0;
+		if (n++ == f->index) {
+			f->pixelformat = fmt->fourcc;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
 }
 
 static int rkcif_stream_enum_framesizes(struct file *file, void *fh,
-- 
2.43.0

