Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B40451989
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785425180; cv=none; b=KwB6d535uXDk6sN3WmaWohZYWREbyZA6PVsSx1Bm4p5AxdhatM0MAIZfwuUop13wNMnbRjPM3FJeppmIrVNY3QTXg6xIqmTUeM9TJSZLxT3mIupnBLcRoeAhImhaolmXtxXB+CZ54rB16mnjDcWM4Vg6OFYCjV8y3AlD8F/0aL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785425180; c=relaxed/simple;
	bh=T+lH6P4Jh/8TThmEJ7OxAn0M8zmeImR1iJbl3YyiF4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hJrqjs57h74BuSiiHX6B2fRFJQYRHAbBwVmqruvvT+inFahPb0xyplV/rRt37WsPh1/aLqhsYuJXUFtqHpSN0l1kkljZvUxc2xs38s5+0RxBqE+pYj7shiyM085OF5EgBl6XJtLHFMdryFXzUFERX6YkwnH6Qvurw19dxaiW41M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gxZxUhj1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bpNsiqbI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gxZxUhj1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bpNsiqbI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEh47w1384881
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K1iXLF8rtNz2LMyn0Lr0ErcP7jmJnSrmwuKU0DdgwKM=; b=gxZxUhj1sX+9Exia
	bkAcmwuqLhYgv3ghxdLppPd9iEhj3q6LgVOw1IsZz/hnSFNiOAD5y2uKH5DZZHf/
	bLfCKiWdBeK+nMEz9kT5JrNL9uMFl7BdtHAw9p+ufR0xTH8KvnS8lrct7xnpW+Va
	hO9OiL88VlmVHjTsde++jqOBS3F7eBL0zgf/Bl2E2ZsjuzrvyzFP3ntrJJ1CBaUM
	cr5bVWLfZxUcsyfStkSSkixABjTvufGtpCl4kYWNuovHYqctTybw89Htj7E4oNZE
	e0UwkxSZosHYjPTDwmQtUxhWStnROqvXBhu2CJYfm3LxKfgUjKcIj5lrFs+oDufk
	YrrKXQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8md07sn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:26:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-520a00c7a03so41467601cf.1
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 08:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785425177; x=1786029977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K1iXLF8rtNz2LMyn0Lr0ErcP7jmJnSrmwuKU0DdgwKM=;
        b=bpNsiqbIfIAISJM5Lef3OesRpHIwKxkIMuvttO0Bg7z0Hg7ULFJJnrJai5mdpt5Rt2
         ZbOFNCPLccirUzMnS/EgQX3L2G8w6uMApSFnBvEegf9XnQ8HlQ+HjsgQSg5EabFD8rEM
         wtJ5oF+HGiphw1atT1+leAQQodn8qp1EhvFoaSeWoa6VcC1Un6xW5cIN1Ipp0ZJqw3eR
         aa45dcgu6iyHvDdP0r+cRrZCiB75PzigSeaxrr82Z4VGdA5lizjlSndY3S4s66hs4lhc
         JVfs1Co8zzFUJohwPULJLmNvOAKe9RcSFkiIQ4mHoQcsgDTfGRBWXOyOhO1AOC7TkuG4
         TDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785425177; x=1786029977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K1iXLF8rtNz2LMyn0Lr0ErcP7jmJnSrmwuKU0DdgwKM=;
        b=BYPqKckqb9+UgfaXLK41IeROlWUdzojRrlj/E4PFPECbUOf2JVCOUi27WusUGVjZcp
         nVIXFgYKbIBy52RXuwJh1dxtULvZhP1WyzE2oInHwlwq7bv0aOhOVzcCIEBLjjkXfWl/
         Xph3guj0noJrxOQ7p7uLIl2p9odGtrj6dTKMFNdKtoihAwHnS+9KYUOW2aAHsjanUrPD
         f7KgfK+jvQhRWa9yngwT3PVvZ8VzM1xd2fYvqouMKT34C1kF/PDcfw5/MtpWVZ+jkMOE
         H/2wBQRvU19djgGWi3yZOsRupxIYxgxq+HxHNSyR/IOBft4ui/YgV6Dnwzq74C+x7doG
         d8+w==
X-Gm-Message-State: AOJu0YzvEKbq0SNIEO7wuqg3hsgFjH8q90ndHSNCNsc5jqyrxfQAoGor
	fMI1Gy6t5kdnpUNaGUqWCZ/kFI/KICFunoNWnDcJjCysT6N6/3Gac95yDdnEN0DchhjFrqlYn36
	Y9CzbUkId9CV00jDbpXovSMB7HejIQev0Oh32Ye3QgqOFIMCPqbYTeTZ6iuF+uFU5SQ==
X-Gm-Gg: AR+sD13gVDxHaCKdDSh3qfoalJ0xsjzlteeXgS6xGHByeMdO89dS/krrQRYelF9SRe3
	zbU9Q3lCLwwhH37xOqotKkzEf9U+sI8j5N9SYayb3RbEgjtyRZARg7t7Xmd+AhRnGG0GuGA0CGU
	u9ACTDB5/dsWwDq0e8oW63oc98XSiQJckTd5GjAwKNG+YbDtzaUST2rW11j5TDw6pDp6ACVvgq9
	lOmMk3ZKqFBw0hIANjYwae/FGIWzq6Zr93/9fYAOlDqCxjYtlr8lLVR9ZFXjMI+BqO/aZwLvfB+
	ptBTLNg8z0vDyATUHivFJw2Xyp0CnQW8gvOgG7pt7Wo4tNFRJ9bGjFmDZEhUabUCP8NZK3WCbj0
	uATH/X43cgHXyOnRLfrzP9ZxhQygtAbrJvt3tw8Wv3XFdLGF5qqPXCMWqwohVLvRdJorNoUMEiq
	KhRUXlMo/wdQJ4ag==
X-Received: by 2002:a05:622a:2611:b0:51c:9e2b:a79b with SMTP id d75a77b69052e-52b384c471amr36530151cf.30.1785425176954;
        Thu, 30 Jul 2026 08:26:16 -0700 (PDT)
X-Received: by 2002:a05:622a:2611:b0:51c:9e2b:a79b with SMTP id d75a77b69052e-52b384c471amr36529701cf.30.1785425176332;
        Thu, 30 Jul 2026 08:26:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ed57asm443160e87.69.2026.07.30.08.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:26:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:26:09 +0300
Subject: [PATCH 2/5] media: iris: take core lock when scanning the instance
 list
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iris-fixes-v1-2-413d6cfaa8ca@oss.qualcomm.com>
References: <20260730-iris-fixes-v1-0-413d6cfaa8ca@oss.qualcomm.com>
In-Reply-To: <20260730-iris-fixes-v1-0-413d6cfaa8ca@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1630;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=T+lH6P4Jh/8TThmEJ7OxAn0M8zmeImR1iJbl3YyiF4o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa20SQyi7+7MDwZPh+cbDWbct57OcsUeGVhJ0X
 HoiBxpMjUOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamttEgAKCRCLPIo+Aiko
 1dlhB/0d/ceBkp4hh6KufQ9R0GVJMjCoQFjnCHsRdLM3ga97RzLWThc30F7MdEV2tjIlYPQa45I
 hEhJrdzemUsdEr9k/0igt2SD8plPKJ77BJkHUnjBn/iT7gKWf2TfmYoYbPMSx/hLvGVLo7SUU0T
 InOFI2kX96Pf68OiCnveUJJgchhPmWSqDUvE73FTyM4UjSFYHUOxH8b+KdfBnm5kOi50055kN23
 MKXqTyRHmVCx46q57kUkGjheLdr3IQ1zWSW1fdOsLvboMPlzalfC/dMBJ2sWkguFdZ7HAA6ECao
 y8rbjLh7gs4h2+Lx5XYcY1DrPyz428QLISZX+81jGJsP9Wzm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=UZphjqSN c=1 sm=1 tr=0 ts=6a6b6d1a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=ArhRcrGwThaRUb-MlkEA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: ldKCcDRi7qRfupjgjS9Pa7sbrC5-qAFN
X-Proofpoint-GUID: ldKCcDRi7qRfupjgjS9Pa7sbrC5-qAFN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNyBTYWx0ZWRfX1KqSGA1m2k+P
 B1jzSsc8xoT7wBakbINUH8AhfgKcCh83fwwg3KkoaYK6DTimHdmc2kzyITdipe/WNSsbI/4TV97
 waKXjtBLwCDetd3twjEuf+9Ks0/l3D4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNyBTYWx0ZWRfX+1RyH4ywUwCO
 Tb5pGTG6FwANAxpiqum6ChJ63XejAZIFibgwVjdrR0QsIqh2ANZqg19fOStdIzHx6F6RmlMjht0
 Y+5T0sr3KZw3FCDJqLEe8FAiNmvQF7zwwOVRbJ/7F9Zj3SpPzosCOv/bjY5HpSLJWVxt/FkKDpy
 Js105SRA9Z0i8WgwCQXgHEbtc/m3yqpF+bsZivlt6Kd18hT4szyHEsjUHCRqLXh4+E0zfyyTf3Z
 l2EzaGNLRuA8TZNpEO9YgUvV/nBbxLIBT5McBDQXb6n/KQif+SlezkIc4KrdxHn/TX6qGORnuvm
 9N4tFMdZRECchq2lFQUTnjTFr02YzhDNA+R60U8zDmT/05iJ7ukA/i9httMCa+9Tzu/2uh0IxoA
 c647XjLH+oUl/PaJI2qI8UJMO+aTGkK0r8ToADHpsOByXVKV9ZIYe7uDnIR92idVQXB5hJF9i71
 XhECj1kr/+DAkA5CA3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300117

iris_check_session_supported() walks core->instances to confirm the
current instance is registered, but does so without holding core->lock.
A concurrent iris_close() takes core->lock and removes a (possibly
different) instance from the list via list_del_init() before freeing it,
so the lockless traversal can follow a freed pointer and dereference it,
resulting in a use-after-free.

Hold core->lock across the list traversal, matching the other iterators
over core->instances such as iris_check_core_mbpf(). The lock is dropped
before iris_check_core_mbpf() is called so the nesting is unchanged.

Fixes: bdbe1cac0c10 ("media: iris: add check whether the video session is supported or not")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vb2.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index a2ea2d67f60d..8faf709c26c1 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -56,10 +56,14 @@ static int iris_check_session_supported(struct iris_inst *inst)
 	bool found = false;
 	int ret;
 
+	mutex_lock(&core->lock);
 	list_for_each_entry(instance, &core->instances, list) {
-		if (instance == inst)
+		if (instance == inst) {
 			found = true;
+			break;
+		}
 	}
+	mutex_unlock(&core->lock);
 
 	if (!found) {
 		ret = -EINVAL;

-- 
2.47.3

