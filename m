Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B764137A3
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785455338; cv=none; b=SttIeWmbyh16MOhZXjqUuMdTQsjYeHpWqJ6Bd+uyUz/zuCW4h7DEG9/It2CD+MsGLx7xjsDeLVscfKSW1Rpmnqp4fXABmgEFuYKcO+Wwowf8bUBEtzAz/uslbwCO/IxTAkvYM6KE/EDvp02BGT2aCTnrW9BL1lIsIoXKQ/nO6SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785455338; c=relaxed/simple;
	bh=hbMAj1Jtog5/mdC3X9nKWxXuxrcta9axgsc6lLpIR6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tJ9oAYrIsCMrJ9BVMAV3aswr32XBtrs9+zFehaElwR19mea3uZ+unghWuIM+aZmJV1Oc2igPgImYmIrO2/OvnHHbSrQkDz+vf/U4fCiHNnx7eRXHqKoqAFfw6og4KCMq2nHAsuMMP093lGl+UpR8tmb7FuzIBbwEYIxpqUy5CsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CMyruUs6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c8MIHbjt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CMyruUs6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c8MIHbjt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMrF6x2009750
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vwMZlMHsuQHU1UftifWPcDYujlD8pisCKUyAh3gzrqE=; b=CMyruUs6pSjVleig
	fZUeC1QfwymVb/x/tMjdLzbRNXmY/SySMkHQpZdsoAkqfut1HGS6tCVlolz+B2tL
	P0QZvIFctKG7vZxXi/jvkRk0oVRO5rG+xqOu+ii0vJGTkZuWidXoFm6SnPfrO0VL
	nSZ3214UVQU/3c3vOSzxE2i47JgWDvtDe5nl86q+v/S7pw0sZvrW6hQGWViEwIdE
	md6IbodAqbjjX60oWOiFI7M6TZLUjlfDgTkBI9DfeWwf/xC/QxCZu6UZ4iOmzL/x
	9Mx0z+41+J82q2X7yRQL1bGR4qNZrFMKLIgYX5pekQan4QHVUoAxJJLUEkADYR/L
	k9KR7w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frfmh05m2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:48:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1a97644aso3679951cf.2
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 16:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785455335; x=1786060135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vwMZlMHsuQHU1UftifWPcDYujlD8pisCKUyAh3gzrqE=;
        b=c8MIHbjt+FBPDNpXY4boFPMJefCyCzP7Ryf7bKV+YEjs6XVUq8hXW95fyCI4T1vom0
         LiQDRY/HmVB+z3khBw2mSJtxa1ltDrGpaGX0g/5sliXk+HacDjqQNL90baOComG0DBiy
         92Q6BbkyT6c4hc3yU1OzZnwpBa/WkDjnj+bvjTDDLvgPzQOEWSQA9ZXpfq45RwcWjUfA
         Hn1Q9D28s614Ufrc9FVsldCqArdm+8XDOm4pM1dPiU87HDgclwnCUKMWu7cFmdXqZ+y+
         pgR0+Il1QhhpT04Fl0LUt0aolRfszATAzmMZL+OuCY1VTxECloA/Rh5Fj9avL3VQu4kG
         E8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785455335; x=1786060135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vwMZlMHsuQHU1UftifWPcDYujlD8pisCKUyAh3gzrqE=;
        b=MdHnkrte0iBDZLjk6GH65BUjjiRn66XOo1y1J1HI/SAPz6HQLAhkWKyx2IxmCJM7tP
         zHN4hqxMl07FSHNYRi5sk8y9pqVqpbqmDhjBk1jtx5+EDnRQ52lJsft/QIyEYNtyFqLG
         Ow6d/gi6K/7Yiqv48oZcdoMJ0xDXvSTPShT20e3Iel+K1wE7QIXi+BOyw+f/10Zd+9pv
         b23uwBlEU/LFu3DwW7A7N6AtGzEknvbFuV3+cVG1yn3AH+a7oRDCgRswGfNA2RswDGH/
         0koBMkZR0V57RngRjMvt4/87UKCFLHwKLKFHjLqW1GiY2bBQkwQsDYj5U6/1zgiNvkBo
         rG1g==
X-Gm-Message-State: AOJu0YykWAOcmzElpM0rZk9pj2TyvTajlLbzkEHDM5vpkqqP4q3txPm1
	q1zlQpPLg2+ntBEfzbyOA4f+v+Kl8oHPqHMkRou1fWwWDUvYAzbTtokDGoroAAhj8/2XDOkQRFH
	zYQx/xDgsyh8jozocH3o3EuaSz+zx74JAqe8UvY0HClNblNbOOmdDZPmiT0J5ePSJnA==
X-Gm-Gg: AR+sD100nd9BO6lVh7aa5hxFeBWqb1svfHSyJjk+8oKz0leOHrpSSJTkzBSALRQWOTf
	HIhKzIuIoJ4dU4eoRb9ZGcZwbf2qTFj/qJkB+5/5uGUeYDPNCnPnsfmZyE+v+bW4fjOy+udHhqy
	uNOiE/7A0Vs7FLu4MCukSkY1QgzIoQ2kzGf6amkkLaC1dg9WHku8G9FM4HmM1hw3zrzBEpclDXB
	aYMQeTDQNNRrw6YiWEh79gioVIYC60OFKH4wPkgXs+rxLSaIj+0vIbDrVEVBGiM4idZ7r7PJ1Wi
	PawJ3l69hYzYhaXNQUMxxObMvT0tYVS0Qh5RULeao+fqN7t4+Ge0+kZCPbMDzG61OQKeI/gu9+e
	ky1yp1z1bjafG3wUYU40Tmh+aPeH8GiQ1JFYZZiTLXlhfCCXIWEBB/Yn59WQcJnNCWSIHYPtGJP
	62nHdSNwF5WnNdqg==
X-Received: by 2002:a05:622a:5c15:b0:521:5c5:f986 with SMTP id d75a77b69052e-52b384c918dmr49314701cf.33.1785455334812;
        Thu, 30 Jul 2026 16:48:54 -0700 (PDT)
X-Received: by 2002:a05:622a:5c15:b0:521:5c5:f986 with SMTP id d75a77b69052e-52b384c918dmr49314531cf.33.1785455334440;
        Thu, 30 Jul 2026 16:48:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ba724sm634487e87.45.2026.07.30.16.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:48:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 02:48:32 +0300
Subject: [PATCH v9 11/19] media: iris: skip PIPE if it is not supported by
 the platform
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-iris-ar50lt-v9-11-d71a782001c0@oss.qualcomm.com>
References: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
In-Reply-To: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hbMAj1Jtog5/mdC3X9nKWxXuxrcta9axgsc6lLpIR6U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa+LLWJdVGnPX70QBCdbtc4J37CKRjhhzwPzXb
 mi9cnYmK5mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamviywAKCRCLPIo+Aiko
 1UrmB/0T1YgXOqC06R513be6YkDazdHaLEe2RxP1Nu2SZxpwGibKiuwVb3yntD7F6oHWgQBx0qz
 IsXu1O68Aq9HihFJryCJxjFbTlOPJaz2dB7zobhZRVn3m7dtgQBWT0kev63BpqrOxw34UyVFZsA
 bjAKvA+G4LcMu3z3uctCJOelF2itS9HmgTkM5/hXII51OQMj+uO7Kpny2tjCtictZzCyyhYPUua
 MDraS09AWrQaxT1nvNyvqf+zy/MFFeMn6TbQo6U58H8R7TKzXCGIoAaaQrkmP7HxY6EDfhaYYrE
 fn/e8YFoCtvxK7H8gwL2Sh+UOWPGIlNsrezpeIjCqkoM3NmC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX0rv/fm9LJO16
 JnjFcrIkFslAO3ehW9b9QBOwx4V3CKtdVX8K8GwB2fBBTMcMTrUZjVqNHgAcYt45oOM1GMWAk3t
 Pt3DDQP51vL8llPtRq22832zqNexbWw=
X-Authority-Analysis: v=2.4 cv=evjvCIpX c=1 sm=1 tr=0 ts=6a6be2e7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=9TuWGWrZIemhly9L:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=DRvvl89rPFtLv9ObwM0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: xp3yKylgvdCc0mL7UgJ9tytTkq88Uop_
X-Proofpoint-ORIG-GUID: xp3yKylgvdCc0mL7UgJ9tytTkq88Uop_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX+VX5df7g80Pc
 UobcODdabFDYFGGJYrvj8OVZIpoR13Ud1g/81zgXRflCcUcW65/wCwmEDM6iSL59J/WNj5Vjj6f
 41WWVlYUpJ4BH2IHNmINFhGOSrylRMJBjK8OD0Hy8Hvmbu+G/j+7iOkM1WQ/zGkOWSkNifezpzw
 XZImHitj68V2sczMDW0YiPPOEYViH2YVt+uXcpb3z6o3vsxV6DH0YHsTb+qmj5qj6+kNpv2mNE3
 22S+cZF9eAtlE10C8XxIzYY7Vhre79EGvLreWOKz9o5yiNcYSVOhTszxGgX8wbk7EqIVGKCkgFk
 vIhI7YoLSpKVQs921bXnDfuFVQ6DreRalKJppEyhJtFzeBXSzXkPpZIckQ7L9h+CF/pEF5XApKv
 BzoDQN5G7eB6ds2CY3Sga5N5Jhai65CWNrgjRXWCFSuuj/28SEr6WJa0ZbNumYaK2qbARfTW1B8
 TGkhSh6uoZPG3Wjys4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300168

AR50Lt doesn't support HFI_PROPERTY_PARAM_WORK_ROUTE. Tables for AR50LT
won't have corresponding entry in the capability tables. Let
iris_set_pipe() silently skip propgramming the property if there is no
corresponding capability.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index bf17d310eac0..cdd02328cb71 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -538,6 +538,9 @@ int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 	u32 work_route = inst->fw_caps[PIPE].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 
+	if (!hfi_id)
+		return 0;
+
 	return hfi_ops->session_set_property(inst, hfi_id,
 					     HFI_HOST_FLAGS_NONE,
 					     iris_get_port_info(inst, cap_id),

-- 
2.47.3

