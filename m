Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021857;
	b=SvtXKkEd/S9S413JuHTNeE2UPIyMNot3w0UpP51EIRKyXpbbGCGLIY9QzIA5vEhVCoQ1
	 qej9LrQyTnwGHEoaHGju4EDeczUF4TTswfEQTE6noe5W+zWSb+EMwZsWlpMrUDXMXBkYg
	 GPo4rxeJd7ZiuMgpL17TsEUO8mARjOImwDiW3NHeDq3dsBs1mt8nYq+6FpVpO5s5ouVyy
	 qGZ1jMk4JFB2qwLIAyty7BJmMRut6EqfDktgGRs7FFYChqT5m2ADSZ7Ab/qJYldYgjDsv
	 1qeQ0y6upM3VlEvg4/Z2bkrvUqFYI7xRJwUe/RVsDxdwGsWT07h7GD3jNYUNTdz4FUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021857;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/fe7KJZz4LmWaTnXBvSSDgY8WYat8lk5T8gWAx1WOoc=;
	b=DHbtDb02WnxIDXOOYdVuE0pr96ztY/5KESD1Vc/JdlplTKlSuT4RTdQbXGZc/LyyzRY5
	 fZG1VnqG1FXNpK4VhOX4xxh3ZnLPn1laxP5dT3bpSeomFspNrJL90B2oGi8hmugXeCMnq
	 yWjW9xbVoZ1UiUWK8xNyutao3FI7bWD0cjCqrpGvgUCpDJQATeAHm6c1IYAyWrdWq5XAo
	 5eC9mBjtFWmuyuKt1ghKRIhHFAr+s0/F8F+ahIabrUluXGkOpjBX7IsV1iYyY3E8xuDAP
	 qb3Xt8PLhfgf9FZZVm26/0GRUCpJgf+5TFEZdPvhK1O2KNfPCadZyenNQ+7SijNgdrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="a/1TC3kD";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PGjzd2Ys;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A483560A2636
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A483560A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a/1TC3kD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PGjzd2Ys
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAsoOl2168546
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:37:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/fe7KJZz4Lm
	WaTnXBvSSDgY8WYat8lk5T8gWAx1WOoc=; b=a/1TC3kDuzDep+hYT2a654DKVBO
	BOa7noMH1xnbjluUQkvFU3YJAAiGxIMnMi4mjS5l+hcpCfVVjo4xqahf8KpZvCCC
	75Cy/ej/y7UV5KzgcuNSICluYz0f6V3gnDj0b7X09hcKxB19tg6BDF6OkOd55Rlo
	kLHiH3NMoQbSCFpCGskRyNpyfa3pZFuq/hSTIVnT92xprgyOB6eMzx4z7adeFB/y
	GZaRfSTDvK5fgTwP1ggK8xkU5xiaFFT+GiVJeqh7EZdetkyQf788p9cOtWb4iVWy
	t4GsSY812ci3Tb48KV84HOKQyH19z+KgquAbVmZPVVrzoIMGCNBkHaipKxw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u610ej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:37:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f6f4fe531so543469685a.0
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 06:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793021855; x=1793626655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/fe7KJZz4LmWaTnXBvSSDgY8WYat8lk5T8gWAx1WOoc=;
        b=PGjzd2YsyN2+DZD6uijPrqwiviuBYu9xVPuwqQZhjimyp7IPwGqyR8Sm+Z7YsGMWjX
         x7QlkGLjB+XtIcrp3gsJHJenZSGY5zpMc69s6j63tORn/Mi+VnimSLlPUlqH2Kh+AtYx
         SvftSLlo9J/Ag/FjgXwi/dgRIX4gmcMKvlWYfmP7kHyOL/AcCLn151l1iAn9tIGugd6X
         UmDLyEH5+7GDK+i8o6naoNk9AiZ8f8CT+OUdF1b1w5Arq/0rS8+rcQm+6Y0muiQfYjkE
         g6OFiHxZ4fpOFxp1ZXqgxshg2QfFlVWs+1evAY9PMV7fb4BQYpiBg+sMDzDDtjNlEy/5
         kaMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021855; x=1793626655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/fe7KJZz4LmWaTnXBvSSDgY8WYat8lk5T8gWAx1WOoc=;
        b=1mZlaO4wX1zKm8emog1HHND+tQcJwTq/XjsPhw4hJtn6T8EVMgS3IXdDISJ3hBCRQ/
         2E+D4bvGF4/T66DOhtSFM0UEL/rWnU8ale4VOAmf1wYp+4UF5E3d82i35F8OdDY03iWA
         Hx9TlVqgn5sC6g+EiduOfy6VgspvvulJvc8m9KpmrPLsQIaf66+FqItLr5jIXhtDNBUK
         30bAqwQzMCvc9oVSm4nBbyr1YfnsWbm+vZoJcl0SZjK2D3rAzMrYW2EibA89rJmKRZzh
         L9+3tvRZ1tFE0B2zQzSVDLcOkpONaubQw+K5QDz4US8bj/mIQlMKIfV59WrquV6/KVr+
         HGKg==
X-Forwarded-Encrypted: i=1; AKwUvBxSC0fncTrL1728/LDrAY5WP/otF6tnp3iHPeH50uCrSqmQzsg7zEezvMa24P20T6NspOQai986u40rsQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYK0BL0V1DetfmsPhAOqTPZK7ds5OdLlZmZj0tuIUfhNM8QdKGfW
	/Fofb7fB5VzXiigcrQ2oFb92nsz9hzzso4OPasZZ/2VG95FbvP3pSH/kpOvytxyszX+g6GOjdES
	BumxDD199/rfkwK77oTSn0EX4XrwE8WA9j+57DGbFsUVv1KrPkPf501OeWY7p8AUrHg==
X-Gm-Gg: AYBFou20v62RP29AmFqnOGkh+aep2ogYeF2LQwlzLvcieaAO3vw3tbObiDxtWqLcjUE
	QfpOkNSE0PXsec2kCJltbvy7rkIPcn2XuvsIReIuI1Sth+bAJNsECRHvpP4fmlrN2SyGQ73JrOb
	n8bovBePX+9v7taAoJNqXr4zR5sJqCL55+4te2FuaAIO961wxyw0FyEXC+ODPoj/RPkquNH2Lcs
	pbyq4//uxfGtyF5raDVNSzD5oXoEkAGXKGGnXHLFyrzRGv3qvpgz1DWIKN5OepgPBaxC4oM1xFY
	qf3TWh5eMGYtFIR9eLrrvNW5Q9xdX/XIwDYab3Ce/4GbblHdVWCq0vibx92OXVpqPAhYgQU5PHh
	QHoNUhGGQMcbnqoQ0hqPZQqFI
X-Received: by 2002:a05:620a:4087:b0:93e:c12c:4416 with SMTP id af79cd13be357-940ef9cee5amr944690985a.82.1793021854962;
        Mon, 26 Oct 2026 06:37:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4087:b0:93e:c12c:4416 with SMTP id af79cd13be357-940ef9cee5amr944686785a.82.1793021854482;
        Mon, 26 Oct 2026 06:37:34 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f305sm15376512f8f.3.2026.10.26.06.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:37:33 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/6] media: qcom: camss: clamp VFE clock rates to the highest level
Date: Mon, 26 Oct 2026 15:37:22 +0200
Message-Id: <20261026133726.3249235-3-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-GUID: O2FGAPlFtRc9MkkbqK0guVd_QUuymjoQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfX0UZ+OfpsCOpv
 5dDacwY/hSJtajTIJG6HDQJQHuCjlLVeX6TSxr8AP9atpvjOIfkA+vPfQ+ZNUQIsF8c9p7hb4Uu
 kTND3jw+2NMLukUTSWcWHhvUUXA3hf0WeObqcLNV+tRZlHaJDq5xVP+JO4H8/sDuRuBb6hY6eYZ
 ZytjLv8ErWQaFEBISW6//56X1TzSO37SvfroLVPEsNuXdPYUgnZXTQ+RCPeQnD8oghrrQKLDuH6
 KTjv18DcoQ+t0aAC2s61mvKU4aTgKqcKCo2JlWS1AoYom8ABlaw+Fqnu/llbjBsL+PoanEBwgEj
 efPU+QHt/R0aavb6Tlbjzu0YPTVS95g8cNIBPDL+HkVjkyouraVSiEOxrN7Hvc49e04kxgRJSEl
 rXEepxu25hNr0WxJqWGqw+4weSg73jgavj+jmJdQNZyyS5dOH67vOwt7uUpsyKG6t30fXF9ha0j
 Y3nzx+nLSApXan3Y4cg==
X-Proofpoint-ORIG-GUID: O2FGAPlFtRc9MkkbqK0guVd_QUuymjoQ
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf579f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=yH3Gd9U0UaHnWrszFSEA:9 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfX9Ds3NoHw8LJJ
 Y9T2nkFBNX3OwmTUnX16BV0zt5Uzr6+/igBLwr0HZmZ22v6CFmk2QH/EBG2NjGc/oaoiUIHHvN/
 2nb7+DlLiNQTQ7srTipAFZrrX1YX6Rw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260054

The VFE fails to power on when the pixel rate exceeds the highest rate
listed for any of its clocks. The rate tables of the VFE clocks are
independent and need not have the same number of levels, so a clock
with a lower top rate than the VFE core clock, such as the SC7280
camnoc_axi clock, makes the VFE reject pixel rates the core clock
still supports.

Clamp each clock to its highest listed rate instead, and warn that the
pixel rate exceeds it when the clock lists more than one rate. Take the
clamp into account when another line powers on an already running VFE,
so that a clock running at its highest rate does not reject the
request.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 59be37f83df3..359b5942df89 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -996,15 +996,13 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
 		if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_levels(clock)) {
 			long rate;
 
-			for (j = 0; j < clock->nfreqs; j++)
+			for (j = 0; j < clock->nfreqs - 1; j++)
 				if (min_rate < clock->freq[j])
 					break;
 
-			if (j == clock->nfreqs) {
-				dev_err(dev,
-					"Pixel clock is too high for VFE");
-				return -EINVAL;
-			}
+			if (clock->nfreqs > 1 && min_rate >= clock->freq[j])
+				dev_warn(dev, "Pixel clock is too high for VFE clock %s\n",
+					 clock->name);
 
 			/* if sensor pixel clock is not available */
 			/* set highest possible VFE clock rate */
@@ -1046,9 +1044,15 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
 
 		if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_levels(clock)) {
 			unsigned long rate;
+			long max_rate;
+
+			/* A clock already at its highest rate cannot go higher */
+			max_rate = clk_round_rate(clock->clk, clock->freq[clock->nfreqs - 1]);
+			if (max_rate < 0)
+				return max_rate;
 
 			rate = clk_get_rate(clock->clk);
-			if (rate < min_rate)
+			if (rate < min_t(u64, min_rate, max_rate))
 				return -EBUSY;
 		}
 	}
-- 
2.34.1

